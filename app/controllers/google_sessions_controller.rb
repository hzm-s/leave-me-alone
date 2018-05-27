class GoogleSessionsController < ApplicationController

  def create
    google_identity = GoogleSignIn::Identity.new(params[:google_id_token])

    if user = User.find_by_google_user_id(google_identity.user_id)
      sign_in(user.id)
      redirect_to todo_list_url, notice: 'ログインしました'
    else
      redirect_to new_session_url, notice: 'ユーザー登録してください'
    end
  end
end
