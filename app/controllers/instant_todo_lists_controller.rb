class InstantTodoListsController < ApplicationController

  def show
    @list = TodoList.new
    render 'todo_lists/show'
  end
end
