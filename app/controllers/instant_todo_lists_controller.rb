class InstantTodoListsController < ApplicationController
  include TodoListHelpers
  include GuestHelpers

  layout 'app'

  before_action :require_guest
  before_action :register_guest, only: [:show]
  before_action :require_registered_guest, only: [:update]
  before_action :set_todo_list

  def show
    @instant_mode = true
    render 'todo_lists/show'
  end

  def update
    new_todo_list = build_new_todo_list(todo_list_params)
    @list.update_with(new_todo_list)
    @list.save!
  end

  private

    def set_todo_list
      @list = TodoList.find_by_guest_id(current_guest.id)
    end
end
