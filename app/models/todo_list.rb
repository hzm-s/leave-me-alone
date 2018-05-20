class TodoList < ApplicationRecord
  has_many :todos

  after_initialize do
    self.title ||= 'Todo'
  end

  def update_with(new_todo_list)
    self.title = new_todo_list.title
    self.todos = new_todo_list.todos
  end

  def add(content:, done: false)
    self.todos.build(content: content, done: done)
  end
end
