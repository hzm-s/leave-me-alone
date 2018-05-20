require 'rails_helper'

describe TodoList do
  let(:list) do
    TodoList.new(title: 'Todo') do |list|
      list.add(content: 'Alpha')
      list.add(content: 'Bravo')
      list.add(content: 'Charlie')
    end
  end

  it do
    new_list = TodoList.new(title: 'Todo r2') do |new_list|
      new_list.add(content: 'Alpha')
      new_list.add(content: 'Bravo', done: true)
      new_list.add(content: 'Charlie!')
      new_list.add(content: 'Delta')
      new_list.add(content: 'Echo', done: true)
    end

    list.update_with(new_list)

    expect(list.title).to eq('Todo r2')
    expect(list.todos.size).to eq(5)
    expect(list.todos[0].content).to eq('Alpha')
    expect(list.todos[0]).to_not be_done
    expect(list.todos[1].content).to eq('Bravo')
    expect(list.todos[1]).to be_done
    expect(list.todos[2].content).to eq('Charlie!')
    expect(list.todos[2]).to_not be_done
    expect(list.todos[3].content).to eq('Delta')
    expect(list.todos[3]).to_not be_done
    expect(list.todos[4].content).to eq('Echo')
    expect(list.todos[4]).to be_done
  end
end
