require 'rails_helper'

describe AddInstantTodoListCommand do
  let(:guest) { Guest.create! }

  it do
    r = described_class.run(guest)
    expect(r).to be_succeeded
  end

  it do
    r = described_class.run(guest)

    list = TodoList.find_by_guest_id(guest.id)
    expect(r.todo_list).to eq(list)
  end

  it do
    expect { described_class.run(guest) }
      .to change { TodoList.count }.by(1)
      .and change { GuestsTodoList.count }.by(1)
  end
end
