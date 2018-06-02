require 'rails_helper'

describe User do
  it do
    user = User.create!(name: 'User')
    todo_list = TodoList.new

    user.own_todo_list(todo_list)
    user.save!

    aggregate_failures do
      expect(user.todo_list_id).to_not be_nil
      expect(user.todo_list_id).to eq(todo_list.id)
    end
  end
end
