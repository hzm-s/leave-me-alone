require 'rails_helper'

describe 'Sign in with google' do
  context 'when signed up' do
    it do
      google_identity = mock_google_sign_in_identity
      user = sign_up_with_google_identity(google_identity)

      post google_session_path, params: { google_id_token: google_identity.token }, xhr: true
      follow_turbolinks_visit!

      aggregate_failures do
        expect(response.body).to include(user.name)
        expect(response.body).to include(user.avatar_url)
        expect(response.body).to include('ログアウト')
      end
    end
  end

  context 'when NOT signed up' do
    it do
      google_identity = mock_google_sign_in_identity
      post google_session_path, params: { google_id_token: google_identity.token }, xhr: true
      expect(response.body).to include('ユーザー登録してください')
    end
  end

  context 'when google id token = nil' do
    it do
      post google_session_path, params: { google_id_token: nil }, xhr: true
      expect(response.body).to include('もう一度ログインしてください')
    end
  end
end
