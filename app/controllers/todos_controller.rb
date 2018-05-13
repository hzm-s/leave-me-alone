class TodosController < ApplicationController

  def create
    @list = TodoList.last
    @add_command = AddTodoCommand.new(param_todo_list_id: @list.id, param_todo: add_todo_params[:param_todo])
    result = @add_command.run

    if result.succeeded?
      redirect_to todo_list_url
    else
      render :new
    end
  end

  private

    def add_todo_params
      params.require(:add_todo_command).permit(:param_todo)
    end
end
