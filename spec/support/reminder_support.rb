module ReminderSupport
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

  def clear_remind_at
    js = <<~JS
      document.getElementById('test-remind-at').dataset.reminderAt = '';
    JS
    execute_script(js)
  end
end

RSpec.configure do |c|
  c.include ReminderSupport, type: :system
end
