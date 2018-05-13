class TodoStatus < Struct.new(:status)
  TODO = new(:todo).freeze
  DONE = new(:done).freeze
end
