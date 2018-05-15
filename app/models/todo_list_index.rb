class TodoListIndex < SimpleDelegator

  def initialize(num)
    raise ArgumentError if num.to_i < 0 || num.to_i > 14
    super(num.to_i)
  end
end
