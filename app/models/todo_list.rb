class TodoList < ApplicationRecord
  has_many :todos, dependent: :destroy

  after_initialize do
    self.title ||= 'Todo'
    self.updated_at ||= Time.current
  end

  class << self
    def find_by_user_id(user_id)
      UsersTodoList.find_todo_list_by_user_id(user_id)
    end
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
