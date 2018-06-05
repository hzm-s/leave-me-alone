class SettingForm
  include ActiveModel::Model

  attr_accessor :interval_in_minutes

  def remind_interval
    RemindInterval.new(interval_in_minutes)
  end
end
