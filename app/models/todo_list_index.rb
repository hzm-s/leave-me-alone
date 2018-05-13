class TodoListIndex < SimpleDelegator

  def initialize(num)
    raise ArgumentError if num < 0 || num > 14
    super
  end
end
