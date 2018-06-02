require 'rails_helper'

describe 'Instant mode', type: :system, js: true do
  before do
    visit instant_todo_list_path
  end

  it do
    wait_for_todo_list_save(reload: false) do
      edit_todo_list_title('Yarukoto')
      add_todo('Alpha')
      add_todo('Bravo')
      done(1)
    end

    guest = Guest.last
    todo_list = TodoList.find_by_guest_id(guest.id)

    aggregate_failures do
      expect_reminder_scheduled
      expect(todo_list.title).to eq('Yarukoto')
      expect(todo_list.todos[0].content).to eq('Alpha')
      expect(todo_list.todos[0]).to_not be_done
      expect(todo_list.todos[1].content).to eq('Bravo')
      expect(todo_list.todos[1]).to be_done
    end
  end
end
