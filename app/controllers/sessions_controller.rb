class SessionsController < ApplicationController
  before_action :require_guest, only: [:new]

  def destroy
    cookies.delete(:user_id)
    redirect_to new_session_url, notice: 'ログアウトしました'
  end
end
