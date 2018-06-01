require 'rails_helper'

describe 'Instant mode', type: :system, js: true do
  before do
    visit instant_todo_list_path
  end

  describe 'Show list' do
    it do
      expect_reminder_scheduled
    end
  end

  describe 'Edit title' do
    it do
      edit_todo_list_title('Yarukoto')
      aggregate_failures do
        expect(page).to have_content('Yarukoto')
        expect_reminder_scheduled
      end
    end
  end

  describe 'Add a todo' do
    it do
      add_todo('Alpha')
      aggregate_failures do
        expect(page).to have_content('Alpha')
        expect_reminder_scheduled
      end
    end
  end

  describe 'Edit a todo' do
    it do
      add_todo('Fox')
      edit_todo(0, 'Foxtrot')
      aggregate_failures do
        expect(page).to have_content('Foxtrot')
        expect_reminder_scheduled
      end
    end
  end

  describe 'Remove a todo' do
    it do
      add_todo('Golf')
      remove_todo(0)
      aggregate_failures do
        expect(page).to_not have_content('Golf')
        expect_reminder_scheduled
      end
    end
  end

  describe 'Done' do
    it do
      add_todo('Echo')
      done(0)
      aggregate_failures do
        expect(todo_checked(0)).to be_truthy
        expect_reminder_scheduled
      end
    end
  end

  describe 'Revert done' do
    it do
      add_todo('Hotel')
      done(0)
      revert_done(0)
      aggregate_failures do
        expect(todo_checked(0)).to be_falsey
        expect_reminder_scheduled
      end
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
