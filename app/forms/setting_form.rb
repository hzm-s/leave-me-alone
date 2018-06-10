class SettingForm
  include ActiveModel::Model

  attr_accessor :remind_interval
  attr_accessor :domain_objects

  validates :remind_interval, domain_object: { object_class: RemindInterval, method: :from_minutes }
end
