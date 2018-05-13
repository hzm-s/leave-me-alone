require 'rails_helper'

describe TodoListIndex do
  it do
    expect { TodoListIndex.new(0) }.to_not raise_error
  end

  it do
    expect { TodoListIndex.new(14) }.to_not raise_error
  end

  it do
    expect { TodoListIndex.new(-1) }.to raise_error(ArgumentError)
  end

  it do
    expect { TodoListIndex.new(15) }.to raise_error(ArgumentError)
  end
end
