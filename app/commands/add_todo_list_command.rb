class AddTodoListCommand < ApplicationCommand

  def run(user)
    todo_list = TodoList.new
    transaction do
      todo_list.save!
      UsersTodoList.create!(user: user, todo_list: todo_list)
    end
    success(todo_list: todo_list)
  end
end
