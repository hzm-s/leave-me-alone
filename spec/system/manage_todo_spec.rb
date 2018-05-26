require 'rails_helper'

describe 'Mange todo list item', type: :system, js: true do
  before do
    TodoList.create!
    visit todo_list_path
  end

  describe 'Add todo' do
    it do
      add_todo('Alpha')
      expect(page).to have_content('Alpha')
    end
  end

  describe 'Remove todo' do
    it do
      add_todo('Bravo')
      remove_todo(0)
      expect(todos).to be_empty
    end
  end

  private

    def add_todo(content)
      find('#test-new-todo-content').set(content)
      find('#test-create-todo').click
    end

    def remove_todo(index)
      all('.test-list-item')[index].hover
      click_on '削除する'
    end

    def todos
      all('.test-list-item')
    end
end
