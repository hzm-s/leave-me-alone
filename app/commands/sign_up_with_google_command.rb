class SignUpWithGoogleCommand < ApplicationCommand

  def run(google_identity, guest: nil)
    user = User.new_with_google_identity(google_identity)
    user.reminder_setting = ReminderSetting.default

    transaction do
      user.save!
      PrepareTodoListCommand.run!(user, guest: guest)
    end
  rescue => e
    failure(message: e.message)
  else
    success(user: user)
  end
end
