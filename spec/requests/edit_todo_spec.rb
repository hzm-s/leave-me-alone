require 'rails_helper'

describe 'Todoの編集' do
  it do
    list = TodoList.create
    AddTodoCommand.run(param_todo_list_id: list.id, param_todo: 'ABC')

    patch todo_path(todo_list_id: list.id, todo_list_index: 0), params: { update_todo_command: { param_todo: 'XYZ' } }
    follow_redirect!

    expect(response.body).to include('XYZ')
  end
end
