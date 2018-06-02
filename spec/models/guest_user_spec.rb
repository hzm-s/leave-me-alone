require 'rails_helper'

describe Guest do
  it do
    guest = Guest.create!
    todo_list = TodoList.new

    guest.own_todo_list(todo_list)
    guest.save!

    aggregate_failures do
      expect(guest.todo_list_id).to_not be_nil
      expect(guest.todo_list_id).to eq(todo_list.id)
    end
  end
end
