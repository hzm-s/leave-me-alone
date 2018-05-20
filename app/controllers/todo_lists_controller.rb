class TodoListsController < ApplicationController

  def show
    @list = TodoList.last
  end
end
