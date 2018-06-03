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

  describe '#update' do
    context 'when signed in' do
      before { sign_in(sign_up) }

      it do
        patch instant_todo_list_path, xhr: true
        expect(response.body).to include('ログインしています')
      end
    end

    context 'when guest id = nil' do
      it do
        patch instant_todo_list_path, xhr: true
        follow_turbolinks_visit!

        expect(response.body).to include('ユーザー登録')
      end
    end
  end
end
