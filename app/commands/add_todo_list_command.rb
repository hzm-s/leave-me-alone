class AddTodoListCommand < ApplicationCommand

  def run(user)
    todo_list = TodoList.new
    user.own_todo_list(todo_list)
    user.save!

    success(todo_list: todo_list)
  end
end
