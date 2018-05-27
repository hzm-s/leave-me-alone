module UserSupport
  class DummyGoogleIdentity < Struct.new(:token, :user_id, :name, :avatar_url)
    class << self
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

    def initialize(attrs)
      user_id = self.class.generate_user_id
      attrs.merge!(
        token: SecureRandom.base64(12),
        user_id: user_id,
        name: self.class.generate_name(user_id),
        avatar_url: self.class.generate_avatar_url(user_id)
      )
      super(*attrs.values_at(:token, :user_id, :name, :avatar_url))
      yield(self) if block_given?
    end
  end

  module Common
    def generate_google_identity(attrs = {})
      DummyGoogleIdentity.new(attrs)
    end

    def mock_google_sign_in_identity(google_identity_attrs = {})
      google_identity = generate_google_identity(google_identity_attrs)
      allow(GoogleSignIn::Identity).to receive(:new) do |token|
        if token == google_identity.token
          google_identity
        else
          nil
        end
      end
      google_identity
    end

    def sign_up_with_google(google_identity = DummyGoogleIdentity.new)
      SignUpWithGoogleCommand.run(google_identity).user
    end
  end
end

RSpec.configure do |c|
  c.include UserSupport::Common
end
