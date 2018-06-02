class User < ApplicationRecord
  has_one :google_identity
  has_one :profile, class_name: 'UserProfile'

  before_create do
    self.signed_up_at = Time.current
  end

  delegate :sub, to: :google_identity, prefix: true
  delegate :avatar_url, to: :profile

  alias_method :google_user_id, :google_identity_sub

  class << self
    def new_with_google_identity(google_identity)
      new(name: google_identity.name) do |user|
        user.build_google_identity(sub: google_identity.user_id)
        user.build_profile(avatar_url: google_identity.avatar_url)
      end
    end

    def find_by_google_user_id(google_user_id)
      joins(:google_identity).find_by(google_identities: { sub: google_user_id })
    end
  end
end
