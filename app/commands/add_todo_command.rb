class AddTodoCommand < ApplicationCommand
  attr_accessor :param_todo_list_id, :param_todo

  validates :param_todo_list_id, presence: true
  validates :param_todo,
    presence: true,
    domain_object: { object_class: Todo, allow_nil: true }

  def run
    return failure(errors: errors) unless valid?

    todo = Todo.new(param_todo)
    list = TodoList.find(param_todo_list_id)
    list.add(todo)
    list.save
    success(todo_list_id: list.id)
  end
end
