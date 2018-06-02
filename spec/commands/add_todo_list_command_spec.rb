require 'rails_helper'

describe AddTodoListCommand do
  let(:user) { User.new(name: 'User') }

  it do
    r = described_class.run(user)
    expect(r).to be_succeeded
  end

  it do
    r = described_class.run(user)
    todo_list = TodoList.last
    expect(r.todo_list).to eq(todo_list)
  end

  it do
    expect { r = described_class.run(user) }
      .to change { TodoList.count }.by(1)
      .and change { UsersTodoList.count }.by(1)
  end

  it do
    allow(UsersTodoList).to receive(:create!).and_raise
    expect { described_class.run!(user) }.to raise_error(RuntimeError)
  end
end
