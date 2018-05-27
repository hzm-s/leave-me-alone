class InitializeCommand < ApplicationCommand

  def run(user)
    todo_list = TodoList.new(user_id: user.id)
    todo_list.save!
    success
  end
end
