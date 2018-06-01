class InstantTodoListsController < ApplicationController
  layout 'todo_list'

  def show
    @list = TodoList.new
    @instant_mode = true
    render 'todo_lists/show'
  end
end
