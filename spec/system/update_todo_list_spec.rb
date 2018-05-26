require 'rails_helper'

describe 'Update todo list', type: :system, js: true do
  before do
    TodoList.create
    visit todo_list_path
  end

  describe 'Initial' do
    it do
      expect(page).to have_content('Todo')
      expect(todos).to be_empty
    end
  end

  describe 'Update todo list title' do
    it do
      edit_todo_list_title('Yarukoto')
      wait_for_todo_list_saved
      expect(page).to have_content('Yarukoto')
    end
  end

  describe 'Add todo' do
    it do
      add_todo('Alpha')
      wait_for_todo_list_saved
      expect(page).to have_content('Alpha')
    end
  end

  describe 'Edit todo' do
    it do
      add_todo('Alpha')
      edit_todo(0, 'Bravo')
      wait_for_todo_list_saved
      expect(page).to have_content('Bravo')
    end
  end

  describe 'Remove todo' do
    it do
      add_todo('Alpha')
      add_todo('Bravo')
      remove_todo(0)
      wait_for_todo_list_saved
      expect(page).to_not have_content('Alpha')
      expect(page).to have_content('Bravo')
    end
  end

  describe 'Done' do
    it do
      add_todo('Alpha')
      done(0)
      wait_for_todo_list_saved
      expect(page).to have_checked_field('Alpha')
    end
  end

  describe 'Revert done' do
    it do
      add_todo('Alpha')
      done(0)
      wait_for_todo_list_saved
      revert_done(0)
      wait_for_todo_list_saved
      expect(page).to_not have_checked_field('Alpha')
    end
  end

  describe 'Timestamp' do
    it do
      add_todo('Alpha')
      wait_for_todo_list_saved
      expect(page).to have_content('数秒前に保存済み')
    end
  end
end
