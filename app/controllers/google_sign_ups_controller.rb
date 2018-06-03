class GoogleSignUpsController < ApplicationController
  include GoogleSignInHelpers
  include GuestHelpers

  before_action :require_guest
  before_action :require_google_id_token
  before_action :ensure_not_signed_up

  def create
    result = SignUpWithGoogleCommand.run(google_identity, guest: current_guest)

    if result.succeeded?
      sign_in(result.user.id)
      redirect_to todo_list_url
    else
      flash_via_js notice: 'もう一度お試しください'
    end
  end

  private

    def ensure_not_signed_up
      if User.find_by_google_user_id(google_identity.user_id)
        flash_via_js notice: 'ユーザー登録済みです'
      end
    end
end
