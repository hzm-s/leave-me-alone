require 'rails_helper'

describe 'Sign out' do
  context 'when signed in' do
    let(:google_identity) { mock_google_sign_in_identity }

    before do
      sign_up_with_google_identity(google_identity)
      post google_session_path, params: { google_id_token: google_identity.token }, xhr: true
    end

    it do
      delete session_path
      follow_redirect!

      aggregate_failures do
        expect(response.body).to include('ログアウトしました')

        get todo_list_path
        follow_redirect!
        expect(response.body).to include('ログインしてください')
      end
    end
  end
end
