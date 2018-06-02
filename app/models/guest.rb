class Guest < ApplicationRecord
  has_one :guests_todo_list
  has_one :todo_list, through: :guests_todo_list

  delegate :todo_list_id, to: :guests_todo_list, allow_nil: true

  after_initialize do
    self.registered_at ||= Time.current
  end

  def own_todo_list(todo_list)
    self.todo_list = todo_list
  end

  def release_todo_list
    self.todo_list = nil
  end
end
