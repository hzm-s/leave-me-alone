class SignUpWithGoogleCommand < ApplicationCommand
  attr_accessor :google_user_id, :name, :avatar_url

  def self.run_with_google_identity(google_identity)
    run(
      google_user_id: google_identity.user_id,
      name: google_identity.name,
      avatar_url: google_identity.avatar_url
    )
  end

  def run
    user =
      User.new(name: name) do |user|
        user.build_profile(avatar_url: avatar_url)
        user.build_google_identity(sub: google_user_id)
        user.save
      end
    success(user: user)
  end
end
