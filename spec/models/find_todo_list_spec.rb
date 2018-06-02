require 'rails_helper'

describe 'Find a todo list' do
  describe '#find_by_user_id' do
    it do
      user_a = sign_up
      user_b = sign_up

      list = TodoList.find_by_user_id(user_a.id)

      users_todo_list = UsersTodoList.find_by(todo_list_id: list.id)
      expect(users_todo_list.user_id).to eq(user_a.id)
    end
  end

  xdescribe '#find_by_guest_id' do
    it do
      guest_a = Guest.create!
      guest_b = Guest.create!

      list = TodoList.find_by_guest_id(guest_a.id)

      guests_todo_list = GuestsTodoList.find_by(todo_list_id: list.id)
      expect(guests_todo_list.user_id).to eq(guest_a.id)
    end
  end
end
