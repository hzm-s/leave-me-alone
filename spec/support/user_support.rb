module UserSupport
  class DummyGoogleIdentity < Struct.new(:token, :user_id, :name, :avatar_url)
    class << self
      def generate
        user_id = generate_user_id
        name = generate_name(user_id)
        avatar_url = generate_avatar_url(user_id)
        new(user_id, name, avatar_url)
      end

      def generate_user_id
        SecureRandom.hex(5)
      end

      def generate_name(suffix)
        "ユーザー#{suffix}"
      end

      def generate_avatar_url(suffix)
        "http://avatar.url/#{suffix}"
      end
    end

    def initialize(*args)
      args = [SecureRandom.base64(12)] + args
      super(*args)
      yield(self) if block_given?
    end
  end

  module Common
    def mock_google_sign_in_identity(google_user_id: nil, name: nil, avatar_url: nil)
      google_user_id ||= DummyGoogleIdentity.generate_user_id
      name ||= DummyGoogleIdentity.generate_name(google_user_id)
      avatar_url = DummyGoogleIdentity.generate_avatar_url(google_user_id)

      DummyGoogleIdentity.new(google_user_id, name, avatar_url) do |google_identity|
        allow(GoogleSignIn::Identity).to receive(:new) do |token|
          if token == google_identity.token
            google_identity
          else
            nil
          end
        end
      end
    end

    def sign_up_with_google(google_identity = DummyGoogleIdentity.generate)
      SignUpWithGoogleCommand.run_with_google_identity(google_identity).user
    end
  end
end

RSpec.configure do |c|
  c.include UserSupport::Common
end
