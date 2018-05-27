class GoogleSignUpsController < ApplicationController
  before_action :require_guest
  before_action :require_google_id_token
  before_action :ensure_not_signed_up

  def create
    google_identity = GoogleSignIn::Identity.new(params[:google_id_token])
    result = SignUpWithGoogleCommand.run(google_identity)
    if result.succeeded?
      sign_in(result.user.id)
      redirect_to home_url
    else
      flash_via_js notice: 'もう一度お試しください'
    end
  end

  private

    def require_google_id_token
      if params[:google_id_token].blank?
        flash_via_js notice: 'もう一度お試しください'
      end
    end

    def ensure_not_signed_up
      google_identity = GoogleSignIn::Identity.new(params[:google_id_token])
      if User.find_by_google_user_id(google_identity.user_id)
        flash_via_js notice: 'ユーザー登録済みです'
      end
    end
end
