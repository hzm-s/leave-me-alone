require 'rails_helper'

describe 'GoogleSignUps' do
  describe '#create' do
    context 'when signed in' do
      let(:google_identity) { mock_google_sign_in_identity }

      before do
        sign_up_with_google_identity(google_identity)
        post google_session_path, params: { google_id_token: google_identity.token }, xhr: true
      end

      it do
        post google_sign_up_path, params: { google_id_token: google_identity.token }, xhr: true
        expect(response.body).to include('ログインしています')
      end
    end
  end
end
