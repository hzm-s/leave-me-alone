module GuestSupport
  def register_guest
    RegisterGuestCommand.run!.guest
  end
end

RSpec.configure do |c|
  c.include GuestSupport
end
