require 'rails_helper'

describe 'Instant mode', type: :system, js: true do
  before do
    visit instant_todo_list_path
  end

  describe 'Edit title' do
    it do
      edit_todo_list_title('Yarukoto')
      expect(page).to have_content('Yarukoto')
    end
  end

  describe 'Add a todo' do
    it do
      add_todo('Alpha')
      expect(page).to have_content('Alpha')
    end
  end

  describe 'Edit a todo' do
    it do
      add_todo('Fox')
      edit_todo(0, 'Foxtrot')
      expect(page).to have_content('Foxtrot')
    end
  end

  describe 'Remove a todo' do
    it do
      add_todo('Golf')
      remove_todo(0)
      expect(page).to_not have_content('Golf')
    end
  end

  describe 'Done' do
    it do
      add_todo('Echo')
      done(0)
      expect(todo_checked(0)).to be_truthy
    end
  end

  describe 'Revert done' do
    it do
      add_todo('Hotel')
      done(0)
      revert_done(0)
      expect(todo_checked(0)).to be_falsey
    end
  end

  describe 'Do NOT auto save' do
    it do
      add_todo('Delta')
      visit instant_todo_list_path
      expect(page).to_not have_content('Delta')
    end
  end
end
