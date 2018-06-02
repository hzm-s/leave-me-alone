require 'rails_helper'

describe RegisterGuestCommand do
  it do
    r = described_class.run
    expect(r).to be_succeeded
  end

  it do
    r = described_class.run

    todo_list = TodoList.find_by_guest_id(r.guest.id)
    expect(todo_list).to eq(TodoList.last)
  end

  it do
    expect { described_class.run }
      .to change { Guest.count }.by(1)
      .and change { TodoList.count }.by(1)
      .and change { GuestsTodoList.count }.by(1)
  end
end
