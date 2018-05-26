require 'rails_helper'

describe 'Reminder', type: :system, js: true do
  before { TodoList.create! }

  context 'when show list' do
    it do
      visit todo_list_path
      expect(about_min(30.minutes.from_now)).to include(remind_at)
    end
  end

  private

    def remind_at
      raw_remind_at = find('#test-remind-at')['data-reminder-at']
      Time.zone.parse(raw_remind_at)
    end

    def about_min(base_min)
      (base_min - 1.minutes)..(base_min + 1.minutes)
    end
end
