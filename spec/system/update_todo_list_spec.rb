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
      wait_for_todo_list_save do
        edit_todo_list_title('Yarukoto')
      end
      expect(page).to have_content('Yarukoto')
    end
  end

  describe 'Add todo' do
    it do
      wait_for_todo_list_save do
        add_todo('Charlie')
      end
      expect(page).to have_content('Charlie')
    end
  end

  describe 'Edit todo' do
    it do
      wait_for_todo_list_save do
        edit_todo(0, 'Delta')
      end
      expect(page).to have_content('Delta')
    end
  end

  describe 'Remove todo' do
    it do
      wait_for_todo_list_save do
        remove_todo(0)
      end
      expect(page).to_not have_content('Alpha')
      expect(page).to have_content('Bravo')
    end
  end

  describe 'Done' do
    it do
      wait_for_todo_list_save do
        done(0)
      end
      expect(page).to have_checked_field('Alpha')
    end
  end

  describe 'Revert done' do
    it do
      wait_for_todo_list_save do
        revert_done(1)
      end
      expect(page).to_not have_checked_field('Bravo')
    end
  end

  describe 'Timestamp' do
    it do
      wait_for_todo_list_save do
        add_todo('Delta')
      end
      expect(page).to have_content('数秒前に保存済み')
    end
  end
end
