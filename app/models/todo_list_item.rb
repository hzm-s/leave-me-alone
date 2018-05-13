class TodoListItem < ApplicationRecord
  attribute :status, :compatible_with_string, class_name: :TodoStatus

  after_initialize do
    mark_as_todo
  end

  def mark_as_done
    self.status = TodoStatus::DONE
  end

  def mark_as_todo
    self.status = TodoStatus::TODO
  end

  def done?
    status == TodoStatus::DONE
  end
end
