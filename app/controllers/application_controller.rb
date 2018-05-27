class ApplicationController < ActionController::Base
  helper_method :signed_in?, :current_user

  protected

    def current_user
      @__current_user ||= fetch_user(cookies.signed[:user_id])
    end

    def signed_in?
      current_user.present?
    end

  private

    def fetch_user(user_id)
      User.find_by(id: user_id)
    end
end
