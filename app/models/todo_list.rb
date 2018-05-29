class TodoList < ApplicationRecord
  has_many :todos, dependent: :destroy

  after_initialize do
    self.title ||= 'Todo'
    self.updated_at ||= Time.current
  end

  def update_with(new_todo_list)
    self.title = new_todo_list.title
    self.todos = new_todo_list.todos
    self.updated_at = new_todo_list.updated_at
  end

  def add(content:, done: false)
    self.todos.build(content: content, done: done)
  end
end
