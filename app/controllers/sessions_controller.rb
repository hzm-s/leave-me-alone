class SessionsController < ApplicationController
  before_action :require_guest, only: [:new]
  before_action :require_user, only: [:destroy]

  def destroy
    cookies.delete(:user_id)
    redirect_to new_session_url, notice: 'ログアウトしました'
  end
end
