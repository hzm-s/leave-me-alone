class ReminderSetting < ApplicationRecord
  belongs_to :user

  attribute :interval, :compatible_with_integer, class_name: RemindInterval

  class << self
    def default
      new(interval: RemindInterval.default)
    end
  end

  def ==(other)
    other.instance_of?(self.class) &&
      self.interval == other.interval
  end
end
