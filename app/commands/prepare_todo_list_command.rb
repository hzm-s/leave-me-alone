class PrepareTodoListCommand < ApplicationCommand

  def run(user, guest: nil)
    r = add_or_transfer(user, guest)
    success(todo_list: r.todo_list)
  end

  private

    def add_or_transfer(user, guest = nil)
      return TransferTodoListCommand.run!(user, guest) if guest
      AddTodoListCommand.run!(user)
    end
end
