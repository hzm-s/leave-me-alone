require 'rails_helper'

describe PrepareTodoListCommand do
  let!(:guest) { register_guest }
  let!(:user) { User.create!(name: 'User') }

  context 'given NO guest' do
    it do
      r = described_class.run(user)
      expect(r).to be_succeeded
    end

    it do
      r = described_class.run(user)
      expect(r.todo_list).to eq(TodoList.last)
    end

    it do
      expect { described_class.run(user) }
        .to change { TodoList.count }.by(1)
        .and change { UsersTodoList.count }.by(1)
    end
  end

  context 'given guest' do
    it do
      r = described_class.run(user, guest: guest)
      expect(r).to be_succeeded
    end

    it do
      todo_list = TodoList.find_by_guest_id(guest.id)
      r = described_class.run(user, guest: guest)
      expect(r.todo_list).to eq(todo_list)
    end
  end
end
