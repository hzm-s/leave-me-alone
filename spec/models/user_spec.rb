require 'rails_helper'

describe User do
  describe '#own_todo_list' do
    let(:user) { User.create!(name: 'User') }

    it do
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

      todo_list = TodoList.find_by_guest_id(guest.id)
      user.own_todo_list(todo_list)
      user.save!

      expect { guest.destroy! }.to_not raise_error
    end
  end

  describe '#destroy' do
    it do
      user = sign_up

      list = TodoList.find_by_user_id(user.id)
      new_list = TodoList.new do |list|
        list.add(content: 'Alpha', done: true)
        list.add(content: 'Bravo', done: true)
        list.add(content: 'Charlie')
      end
      list.update_with(new_list)
      list.save!

      expect { user.destroy }
        .to change { User.count }.by(-1)
        .and change { UserProfile.count }.by(-1)
        .and change { GoogleIdentity.count }.by(-1)
        .and change { UsersTodoList.count }.by(-1)
        .and change { TodoList.count }.by(-1)
        .and change { Todo.count }.by(-3)
    end
  end
end
