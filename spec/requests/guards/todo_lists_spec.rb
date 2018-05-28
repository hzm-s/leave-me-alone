require 'rails_helper'

describe 'TodoLists' do
  describe '#show' do
    context 'when not signed in' do
      it do
        get todo_list_path
        follow_redirect!
        expect(response.body).to include('ログインしてください')
      end
    end
  end
end
