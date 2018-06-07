class ReminderSetting < ApplicationRecord
  include ValueObject

  vo_attrs :interval

  belongs_to :user

  attribute :interval, :compatible_with_integer, class_name: RemindInterval

  class << self
    def default
      new(interval: RemindInterval.default)
    end
  end
end
