class GoogleSessionsController < ApplicationController
  before_action :require_guest
  before_action :require_google_id_token

  def create
    google_identity = GoogleSignIn::Identity.new(params[:google_id_token])

    if user = User.find_by_google_user_id(google_identity.user_id)
      sign_in(user.id)
      redirect_to home_url
    else
      flash_via_js notice: 'ユーザー登録してください'
    end
  end

  private

    def require_google_id_token
      if params[:google_id_token].blank?
        flash_via_js notice: 'もう一度お試しください'
      end
    end
end
