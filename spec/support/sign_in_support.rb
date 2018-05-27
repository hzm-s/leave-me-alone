module SignInSupport
  module Common
    def sign_in(user)
      allow_any_instance_of(ApplicationController).to receive(:fetch_user) { user }
    end
  end
end

RSpec.configure do |c|
  c.include SignInSupport::Common
end
