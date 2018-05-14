require 'rails_helper'

describe AddTodoCommand do
  let(:list) { TodoList.create }

  let(:valid) do
    {
      param_todo_list_id: list.id,
      param_todo: 'ABC'
    }
  end

  it do
    result = described_class.run(param_todo_list_id: list.id, param_todo: valid[:param_todo])
    list = TodoList.find(result.todo_list_id)

    expect(result).to be_succeeded
    expect(list.items[0].todo).to eq('ABC')
  end

  it do
    result = described_class.run(valid.merge(param_todo_list_id: nil))
    expect(result).to_not be_succeeded
    expect(result.errors[:param_todo_list_id]).to include('を入力してください')
  end

  it do
    result = described_class.run(valid.merge(param_todo: nil))
    expect(result).to_not be_succeeded
    expect(result.errors[:param_todo]).to include('を入力してください')
  end

  it do
    result = described_class.run(valid.merge(param_todo: 'あ' * 31))
    expect(result).to_not be_succeeded
    expect(result.errors[:param_todo]).to be_any
  end
end
