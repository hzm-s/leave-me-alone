class AddInstantTodoListCommand < ApplicationCommand

  def run(guest)
    todo_list = TodoList.new

    transaction do
      todo_list.save!
      GuestsTodoList.create!(guest: guest, todo_list: todo_list)
    end

    success(todo_list: todo_list)
  end
end
