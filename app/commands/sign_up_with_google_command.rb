class SignUpWithGoogleCommand < ApplicationCommand

  def run(google_identity)
    user = User.new_with_google_identity(google_identity)
    transaction do
      user.save!
      AddTodoListCommand.run!(user)
    end
  rescue => e
    failure(message: e.message)
  else
    success(user: user)
  end
end
