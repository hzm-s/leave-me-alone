require 'rails_helper'

describe 'Mange todo list item', type: :system, js: true do
  before do
    TodoList.create!
    visit todo_list_path
  end

  describe 'Add' do
    it do
      add_todo('Alpha')
      expect(page).to have_content('Alpha')
    end
  end

  describe 'Remove' do
    it do
      add_todo('Bravo')
      remove_todo(0)
      expect(todos).to be_empty
    end
  end
end
