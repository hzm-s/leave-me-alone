class TodosController < ApplicationController

  def create
    result = AddTodoCommand.run(param_todo_list_id: TodoList.last.id, param_todo: add_todo_params[:param_todo])
    redirect_to todo_list_url
  end

  private

    def add_todo_params
      params.require(:add_todo_command).permit(:param_todo)
    end
end
