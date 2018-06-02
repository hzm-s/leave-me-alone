require 'rails_helper'

describe 'InstantTodoLists' do
  describe '#show' do
    context 'when signed in' do
      before { sign_in(sign_up) }

      it do
        get instant_todo_list_path
        follow_redirect!
        expect(response.body).to include('ログインしています')
      end
    end
  end
end
