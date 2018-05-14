require 'rails_helper'

describe UpdateTodoCommand do
  it do
    list = TodoList.create
    AddTodoCommand.run(param_todo_list_id: list.id, param_todo: 'ABC')
    result = described_class.run(param_todo_list_id: list.id, param_todo_list_index: 0, param_todo: 'XYZ')

    expect(result).to be_succeeded
    expect(list.items[0].todo).to eq('XYZ')
  end
end
