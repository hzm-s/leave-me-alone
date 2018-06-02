require 'rails_helper'

describe 'Find a todo list' do
  describe '#find_by_user_id' do
    it do
      user_a = sign_up
      user_b = sign_up

      list = TodoList.find_by_user_id(user_a.id)

      expect(list.id).to eq(user_a.todo_list_id)
    end
  end

  describe '#find_by_guest_id' do
    it do
      guest_a = register_guest
      guest_b = register_guest

      list = TodoList.find_by_guest_id(guest_a.id)

      expect(list.id).to eq(guest_a.todo_list_id)
    end
  end
end
