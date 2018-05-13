require 'rails_helper'

describe 'Todoの追加', type: :system do
  it do
    TodoList.create

    visit todo_list_path
    fill_in 'add_todo_command[param_todo]', with: 'ABC'
    click_on '追加する'

    expect(page).to have_content('ABC')
  end
end
