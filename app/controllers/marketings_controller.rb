class MarketingsController < ApplicationController

  def index
    if signed_in?
      redirect_to todo_list_url
    else
      render
    end
  end
end
