class TodoStatus < Struct.new(:status)
  TODO = new(:todo).freeze
  DONE = new(:done).freeze

  STR_2_STATUS = {
    'todo' => TODO,
    'done' => DONE
  }

  def self.from_string(status)
    STR_2_STATUS[status]
  end
end
