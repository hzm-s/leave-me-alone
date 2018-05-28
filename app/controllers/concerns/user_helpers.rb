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

    def signed_out?
      !signed_in?
    end

    def sign_out
      cookies.delete(:user_id)
    end

    def require_user
      return if signed_in?
      redirect_to new_session_url, alert: 'ログインしてください'
    end

    def require_guest
      return if signed_out?
      msg = 'ログインしています'
      respond_to do |f|
        f.html { redirect_to todo_list_url, notice: msg }
        f.js { flash_via_js notice: msg }
      end
    end

    def fetch_user(user_id)
      User.find_by(id: user_id)
    end
end
