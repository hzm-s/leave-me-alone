class SessionsController < ApplicationController
  before_action :require_guest, only: [:new]

  def destroy
    redirect_to new_session_url, notice: 'ログアウトしました'
  end
end
