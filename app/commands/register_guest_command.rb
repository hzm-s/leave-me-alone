class RegisterGuestCommand < ApplicationCommand

  def run
    guest = Guest.new

    transaction do
      guest.save!
      AddInstantTodoListCommand.run!(guest)
    end

    success(guest: guest)
  end
end
