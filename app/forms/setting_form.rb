class SettingForm
  include ActiveModel::Model

  attr_accessor :reminder_interval_i

  def remind_interval
    RemindInterval.new(reminder_interval_i)
  end
end
