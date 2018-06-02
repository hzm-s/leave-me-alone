class UsersTodoList < ApplicationRecord
  belongs_to :user
  belongs_to :todo_list

  class << self
    def find_todo_list_by_user_id(user_id)
      includes(:todo_list).find_by(user_id: user_id).todo_list
    end
  end
end
