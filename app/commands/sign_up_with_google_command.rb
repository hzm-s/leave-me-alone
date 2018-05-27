class SignUpWithGoogleCommand < ApplicationCommand

  def run(google_identity)
    user = new_user(google_identity)
    transaction do
      user.save!
      InitializeCommand.run!(user)
    end
  rescue
    failure
  else
    success(user: user)
  end

  private

    def new_user(google_identity)
      User.new(name: google_identity.name) do |user|
        user.build_google_identity(sub: google_identity.user_id)
        user.build_profile(avatar_url: google_identity.avatar_url)
      end
    end
end
