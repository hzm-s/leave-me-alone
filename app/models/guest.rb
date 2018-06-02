class Guest < ApplicationRecord
  after_initialize do
    self.registered_at ||= Time.current
  end
end
