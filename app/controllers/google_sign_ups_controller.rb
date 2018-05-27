class GoogleSignUpsController < ApplicationController

  def create
    google_identity = GoogleSignIn::Identity.new(params[:google_id_token])
    user = SignUpWithGoogleCommand.run(google_identity)
    sign_in(user.id)
    redirect_to todo_list_url
  end
end
