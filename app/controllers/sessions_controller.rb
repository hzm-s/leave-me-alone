class SessionsController < ApplicationController

  def create
    id = GoogleSignIn::Identity.new(params[:google_id_token])
    p id.user_id
  end
end
