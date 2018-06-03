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

  it do
    guest = register_guest
    user = User.create!(name: 'User')

    todo_list = TodoList.find_by_guest_id(guest.id)
    user.own_todo_list(todo_list)
    user.save!

    expect { guest.destroy! }.to_not raise_error
  end
end
