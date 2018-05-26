require 'rails_helper'

describe 'Update todo list', type: :system, js: true do
  before do
    TodoList.new(title: 'Todo') do |list|
      list.add(content: 'Alpha')
      list.add(content: 'Bravo', done: true)
      list.save!
    end

    visit todo_list_path
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
      add_todo('Charlie')
      wait_for_todo_list_saved
      expect(page).to have_content('Charlie')
    end
  end

  describe 'Edit todo' do
    it do
      edit_todo(0, 'Delta')
      wait_for_todo_list_saved
      expect(page).to have_content('Delta')
    end
  end

  describe 'Remove todo' do
    it do
      remove_todo(0)
      wait_for_todo_list_saved
      expect(page).to_not have_content('Alpha')
      expect(page).to have_content('Bravo')
    end
  end

  describe 'Done' do
    it do
      done(0)
      wait_for_todo_list_saved
      expect(page).to have_checked_field('Alpha')
    end
  end

  describe 'Revert done' do
    it do
      revert_done(1)
      wait_for_todo_list_saved
      expect(page).to_not have_checked_field('Bravo')
    end
  end

  describe 'Timestamp' do
    it do
      add_todo('Delta')
      wait_for_todo_list_saved
      expect(page).to have_content('数秒前に保存済み')
    end
  end
end
