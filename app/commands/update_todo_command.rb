class UpdateTodoCommand < ApplicationCommand
  attr_accessor :param_todo_list_id, :param_todo_list_index, :param_todo

  def run
    list = TodoList.find(param_todo_list_id)
    index = TodoListIndex.new(param_todo_list_index)
    todo = Todo.new(param_todo)
    list.rewrite(index, todo)
    list.save!
    success
  end
end
