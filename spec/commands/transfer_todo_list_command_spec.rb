require 'rails_helper'

describe TransferTodoListCommand do
  let!(:guest) { register_guest }
  let!(:user) { User.create!(name: 'User') }

  it do
    r = described_class.run(user, guest)
    expect(r).to be_succeeded
  end

  it do
    r = described_class.run(user, guest)
    todo_list = TodoList.find_by_user_id(user.id)
    expect(r.todo_list).to eq(todo_list)
  end

  it do
    expect { described_class.run(user, guest) }
      .to change { TodoList.count }.by(0)
      .and change { UsersTodoList.count }.by(1)
      .and change { GuestsTodoList.count }.by(-1)
  end

  it do
    allow(user).to receive(:save!).and_raise
    expect { described_class.run(user, guest) }.to raise_error(RuntimeError)
  end

  it do
    allow(guest).to receive(:save!).and_raise
    expect { described_class.run(user, guest) }.to raise_error(RuntimeError)
  end
end
