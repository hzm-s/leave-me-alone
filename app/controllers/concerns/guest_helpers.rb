module GuestHelpers
  private

    def register_guest
      @current_guest = RegisterGuestCommand.run!.guest
      cookies.signed[:guest_id] = @current_guest.id
    end

    def current_guest
      @current_guest ||= Guest.find_by(id: cookies.signed[:guest_id])
    end

    def require_registered_guest
      unless current_guest
        redirect_to instant_todo_list_url
      end
    end
end
