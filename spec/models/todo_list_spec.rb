require 'rails_helper'

describe TodoList do
  let(:list) { TodoList.new }
  let(:todo1) { Todo.new('Item1') }
  let(:todo2) { Todo.new('Item2') }
  let(:todo3) { Todo.new('Item3') }

  before do
    list.add(todo1)
    list.add(todo2)
    list.add(todo3)
  end

  it do
    expect(list.items.map(&:todo)).to eq([todo1, todo2, todo3])
  end

  it do
    index = TodoListIndex.new(1)
    list.mark_as_done(index)
    expect(list.items[0].status).to eq(TodoStatus::TODO)
    expect(list.items[1].status).to eq(TodoStatus::DONE)
    expect(list.items[2].status).to eq(TodoStatus::TODO)
  end

  it do
    index = TodoListIndex.new(1)
    list.mark_as_done(index)
    list.mark_as_todo(index)
    expect(list.items[0].status).to eq(TodoStatus::TODO)
    expect(list.items[1].status).to eq(TodoStatus::TODO)
    expect(list.items[2].status).to eq(TodoStatus::TODO)
  end

  it do
    index = TodoListIndex.new(1)
    list.rewrite(index, Todo.new('Rewrite'))
    expect(list.items[0].todo).to eq(todo1)
    expect(list.items[1].todo).to eq('Rewrite')
    expect(list.items[2].todo).to eq(todo3)
  end

  it do
    list.save
    index = TodoListIndex.new(1)
    list.remove(index)
    expect(list.items.reload.map(&:todo)).to eq([todo1, todo3])
  end

  it do
    list.save
    list.remove_all
    expect(list.items.reload).to be_empty
  end

  it do
    list.save
    list.mark_as_done(TodoListIndex.new(1))
    list.remove_done_items
    expect(list.items.reload.map(&:todo)).to eq([todo1, todo3])
  end
end
