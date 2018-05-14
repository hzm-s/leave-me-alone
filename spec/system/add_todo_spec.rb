require 'rails_helper'

describe 'Todoの追加', type: :system, js: true do
  before { TodoList.create }

  it do
    visit todo_list_path
    fill_in 'add_todo_command[param_todo]', with: 'ABC'
    click_on '追加する'
    expect(page).to have_content('ABC')
  end

  it do
    visit todo_list_path
    fill_in 'add_todo_command[param_todo]', with: 'A' * 31
    click_on '追加する'
    expect(page).to have_content('以内で入力してください')
  end
end
