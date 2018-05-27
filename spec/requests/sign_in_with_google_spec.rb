require 'rails_helper'

DummyGoogleIdentity = Struct.new(:user_id, :name, :avatar_url)

describe 'Sign in with google' do
  it do
    google_identity =
      DummyGoogleIdentity.new(1234567890, 'ユーザーABC', 'http://avatar.url')
    allow(GoogleSignIn::Identity).to receive(:new) { google_identity }

    user = SignUpWithGoogleCommand.run_with_google_identity(google_identity).user

    post sign_in_google, params: { google_id_token: 'GOOGLE_ID_TOKEN' }
    follow_redirect!

    expect(response).to include(user.name)
    expect(response).to include(user.profile_avatar_url)
  end
end
