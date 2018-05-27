require 'rails_helper'

describe 'Sign up with google' do
  context 'when NOT signed up' do
    it do
      google_identity = mock_google_sign_in_identity

      post google_sign_up_path, params: { google_id_token: google_identity.token }, xhr: true
      follow_turbolinks_visit!

      aggregate_failures do
        expect(response.body).to include('Todo')
        expect(response.body).to include(google_identity.name)
        expect(response.body).to include(google_identity.avatar_url)
      end
    end
  end

  context 'when signed up' do
    let(:google_identity) { mock_google_sign_in_identity }

    before do
      sign_up_with_google_identity(google_identity)
    end

    it do
      post google_sign_up_path, params: { google_id_token: google_identity.token }, xhr: true
      expect(response.body).to include('ユーザー登録済みです')
    end
  end

  context 'when google id token = nil' do
    it do
      post google_sign_up_path, params: { google_id_token: nil }, xhr: true
      expect(response.body).to include('もう一度お試しください')
    end
  end
end
