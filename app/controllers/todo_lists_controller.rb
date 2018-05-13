class TodoListsController < ApplicationController

  def show
    @list = TodoList.last || TodoList.create
    @add_command = AddTodoCommand.new
  end
end
