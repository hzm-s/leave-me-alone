class TransferTodoListCommand < ApplicationCommand

  def run(user, guest)
    todo_list = TodoList.find_by_guest_id(guest.id)
    user.own_todo_list(todo_list)

    transaction do
      user.save!
      guest.save!
    end

    success(todo_list: todo_list)
  end
end
