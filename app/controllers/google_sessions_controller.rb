class GoogleSessionsController < ApplicationController
  include GoogleSignInHelpers

  before_action :require_guest
  before_action :require_google_id_token

  def create
    if user = User.find_by_google_user_id(google_identity.user_id)
      sign_in(user.id)
      redirect_to todo_list_url
    else
      flash_via_js notice: 'ユーザー登録してください'
    end
  end
end
