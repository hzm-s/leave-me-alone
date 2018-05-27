class GoogleSessionsController < ApplicationController

  def create
    google_identity = GoogleSignIn::Identity.new(params[:google_id_token])
    user = User.find_by_google_user_id!(google_identity.user_id)
    cookies.signed[:user_id] = user.id
    redirect_to todo_list_url, notice: 'ログインしました'
  end
end
