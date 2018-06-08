require 'rails_helper'

describe ReminderSetting do
  it do
    a = ReminderSetting.new(interval: RemindInterval.new(30))
    b = ReminderSetting.new(interval: RemindInterval.new(30))
    expect(a.same_value_as?(b)).to be_truthy
  end

  it do
    a = ReminderSetting.new(user_id: 1, interval: RemindInterval.new(30))
    b = ReminderSetting.new(user_id: 2, interval: RemindInterval.new(30))
    expect(a.same_value_as?(b)).to be_truthy
  end

  it do
    a = ReminderSetting.new(user_id: 1, interval: RemindInterval.new(30))
    b = ReminderSetting.new(user_id: 1, interval: RemindInterval.new(20))
    expect(a.same_value_as?(b)).to be_falsey
  end
end
