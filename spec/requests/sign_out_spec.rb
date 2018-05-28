require 'rails_helper'

describe 'Sign out' do
  context 'when signed in' do
    it do
      google_identity = mock_google_sign_in_identity
      user = sign_up_with_google_identity(google_identity)

      post google_session_path, params: { google_id_token: google_identity.token }, xhr: true

      delete session_path
      follow_turbolinks_visit!

      aggregate_failures do
        expect(response.body).to include('ログアウトしました')

        #get todo_list_path
        #expect(response.body).to include('ログインしてください')
      end
    end
  end
end
