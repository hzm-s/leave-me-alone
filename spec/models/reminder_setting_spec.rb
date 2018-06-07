require 'rails_helper'

describe ReminderSetting do
  it do
    a = ReminderSetting.new(interval: RemindInterval.new(30))
    b = ReminderSetting.new(interval: RemindInterval.new(30))
    expect(a).to eq(b)
  end

  it do
    a = ReminderSetting.new(user_id: 1, interval: RemindInterval.new(30))
    b = ReminderSetting.new(user_id: 2, interval: RemindInterval.new(30))
    expect(a).to eq(b)
  end
end
