require 'rails_helper'

describe 'Reminder', type: :system, js: true do
  before { TodoList.create! }

  xcontext 'when show list' do
    it do
      visit todo_list_path
      expect_reminder_scheduled
    end
  end

  context 'when todo added' do
    it do
      visit todo_list_path
      add_todo('Alpha')
      expect_reminder_scheduled
    end
  end

  private

    def expect_reminder_scheduled
      expect(about_min(30.minutes.from_now)).to include(remind_at)
    end

    def remind_at
      raw_remind_at = find('#test-remind-at')['data-reminder-at']
      Time.zone.parse(raw_remind_at)
    end

    def about_min(base_min)
      (base_min - 1.minutes)..(base_min + 1.minutes)
    end
end
