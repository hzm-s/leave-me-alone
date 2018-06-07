class SettingForm
  include ActiveModel::Model

  attr_accessor :reminder_interval_str

  def remind_interval
    RemindInterval.from_minutes(reminder_interval_str.to_i)
  end
end
