class SignUpWithGoogleCommand < ApplicationCommand

  def run(google_identity, guest: nil)
    user = User.new_with_google_identity(google_identity)

    if guest
      transaction do
        user.save!
        TransferTodoListCommand.run!(user, guest)
      end
    else
      transaction do
        user.save!
        AddTodoListCommand.run!(user)
      end
    end

  rescue => e
    failure(message: e.message)
  else
    success(user: user)
  end
end
