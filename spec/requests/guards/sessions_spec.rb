require 'rails_helper'

describe 'Session' do
  context 'when NOT signed in' do
    it do
      get new_session_path
      expect(response.body).to include('Googleでログイン')
    end
  end

  context 'when signed in' do
    let(:google_identity) { mock_google_sign_in_identity }

    before do
      sign_up_with_google_identity(google_identity)
      post google_session_path, params: { google_id_token: google_identity.token }, xhr: true
    end

    it do
      get new_session_path
      follow_redirect!
      expect(response.body).to include(google_identity.name)
    end
  end
end
