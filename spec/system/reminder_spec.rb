require 'rails_helper'

describe 'Reminder', type: :system, js: true do
  let!(:user) { sign_up }

  before do
    todo_list = user.todo_list
    todo_list.tap do |list|
      list.add(content: 'Alpha')
      list.add(content: 'Bravo', done: true)
      list.save!
    end

    sign_in(user)
    visit todo_list_path
    clear_remind_at
  end

  context 'when show list' do
    it do
      visit todo_list_path
      expect_reminder_scheduled
    end
  end

  context 'when todo added' do
    it do
      add_todo('Charlie')
      expect_reminder_scheduled
    end
  end

  context 'when todo removed' do
    it do
      remove_todo(0)
      expect_reminder_scheduled
    end
  end

  context 'when todo edited' do
    it do
      edit_todo(0, 'Alice')
      expect_reminder_scheduled
    end
  end

  context 'when done' do
    it do
      done(0)
      expect_reminder_scheduled
    end
  end

  context 'when revert done' do
    it do
      revert_done(1)
      expect_reminder_scheduled
    end
  end
end
