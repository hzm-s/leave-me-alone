class InstantTodoListsController < ApplicationController
  layout 'todo_list'

  before_action :require_guest

  def show
    @list = TodoList.new
    @instant_mode = true
    render 'todo_lists/show'
  end
end
