class SettingForm
  include ActiveModel::Model

  attr_accessor :reminder_interval_i

  def remind_interval
    RemindInterval.from_minutes(reminder_interval_i)
  end
end
