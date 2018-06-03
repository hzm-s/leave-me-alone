class GuestsTodoList < ApplicationRecord
  belongs_to :guest
  belongs_to :todo_list

  class << self
    def find_todo_list_by_guest_id(guest_id)
      includes(:todo_list).find_by(guest_id: guest_id).todo_list
    end
  end
end
