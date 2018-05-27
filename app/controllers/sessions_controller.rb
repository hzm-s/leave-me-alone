class SessionsController < ApplicationController

  def new
    if params[:flash]
      flash.now[:notice] = 'ユーザー登録してください'
    end
  end
end
