require 'rails_helper'

describe 'Inline Edit', type: :system, js: true do
  before do
    TodoList.new(title: 'Todo') do |list|
      list.add(content: 'Item123')
      list.save!
    end

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
