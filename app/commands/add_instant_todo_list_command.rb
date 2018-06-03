class AddInstantTodoListCommand < ApplicationCommand

  def run(guest)
    todo_list = TodoList.new
    guest.own_todo_list(todo_list)

    guest.save!

    success(todo_list: todo_list)
  end
end
