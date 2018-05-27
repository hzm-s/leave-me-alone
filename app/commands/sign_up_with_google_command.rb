class SignUpWithGoogleCommand < ApplicationCommand

  def run(google_identity)
    user =
      User.new(name: google_identity.name) do |user|
        user.build_google_identity(sub: google_identity.user_id)
        user.build_profile(avatar_url: google_identity.avatar_url)
        user.save
      end
    success(user: user)
  end
end
