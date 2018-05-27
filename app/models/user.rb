class User < ApplicationRecord
  has_one :google_identity
  has_one :profile, class_name: 'UserProfile'
  has_one :todo_list

  before_create do
    self.signed_up_at = Time.current
  end

  delegate :sub, to: :google_identity, prefix: true
  delegate :avatar_url, to: :profile

  alias_method :google_user_id, :google_identity_sub

  class << self

    def find_by_google_user_id(google_user_id)
      joins(:google_identity).find_by(google_identities: { sub: google_user_id })
    end
  end
end
