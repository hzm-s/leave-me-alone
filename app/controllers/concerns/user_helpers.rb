module UserHelpers
  extend ActiveSupport::Concern

  included do
    helper_method :signed_in?, :current_user
  end

  protected

    def sign_in(user_id)
      cookies.signed[:user_id] = user_id
    end

    def current_user
      @__current_user ||= fetch_user(cookies.signed[:user_id])
    end

    def signed_in?
      current_user.present?
    end

    def require_guest
      if signed_in?
        redirect_to todo_list_url, notice: 'ログインしています'
      end
    end

  private

    def fetch_user(user_id)
      User.find_by(id: user_id)
    end
end
