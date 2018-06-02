class TodoList < ApplicationRecord
  has_one :users_todo_list
  has_many :todos, dependent: :destroy

  after_initialize do
    self.title ||= 'Todo'
    self.updated_at ||= Time.current
  end

  def self.find_by_user_id(user_id)
    joins(:users_todo_list).find_by(users_todo_lists: { user_id: user_id })
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
