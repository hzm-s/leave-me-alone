class TransferTodoListCommand < ApplicationCommand

  def run(user, guest)
    todo_list = TodoList.find_by_guest_id(guest.id)
    transaction do
      UsersTodoList.create!(user: user, todo_list: todo_list)
      GuestsTodoList.find_by(guest_id: guest.id).destroy!
    end
    success(todo_list: todo_list)
  end
end
