class HomesController < ApplicationController

  def index
    if signed_in?
      redirect_to todo_list_url
    else
      render 'marketings/show'
    end
  end
end
