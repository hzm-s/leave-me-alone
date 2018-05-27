class GoogleSessionsController < ApplicationController
  before_action :require_guest
  before_action :require_google_id_token

  def create
    google_identity = GoogleSignIn::Identity.new(params[:google_id_token])

    if user = User.find_by_google_user_id(google_identity.user_id)
      sign_in(user.id)
      redirect_to todo_list_url
    else
      flash.now[:notice] = 'ユーザー登録してください'
      render 'flash'
    end
  end

  private

    def require_google_id_token
      if params[:google_id_token].blank?
        flash.now[:notice] = 'もう一度ログインしてください'
        render 'flash'
      end
    end
end
