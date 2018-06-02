require 'rails_helper'

describe 'Inline Edit', type: :system, js: true do
  let!(:user) { sign_up }

  before do
    todo_list = TodoList.find_by_user_id(user.id)
    todo_list.tap do |list|
      list.add(content: 'Item123')
      list.save!
    end

    sign_in(user)
    visit todo_list_path
  end

  describe 'Title' do
    it do
      edit_todo_list_title('Yarukoto')
      expect(page).to have_content('Yarukoto')
    end
  end

  describe 'Todo' do
    it do
      edit_todo(0, 'Item789')
      expect(page).to have_content('Item789')
    end
  end
end
