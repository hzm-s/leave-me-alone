require 'rails_helper'

describe 'Find a todo list' do
  it do
    user_a = sign_up
    user_b = sign_up

    list = TodoList.find_by_user_id(user_a.id)

    users_todo_list = UsersTodoList.find_by(todo_list_id: list.id)
    expect(users_todo_list.user_id).to eq(user_a.id)
  end
end
