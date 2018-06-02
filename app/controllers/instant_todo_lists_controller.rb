class InstantTodoListsController < ApplicationController
  include TodoListHelpers

  layout 'todo_list'

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

    def register_guest
      @current_guest = RegisterGuestCommand.run!.guest
      cookies.signed[:guest_id] = @current_guest.id
    end

    def require_registered_guest
      unless current_guest
        redirect_to instant_todo_list_url
      end
    end

    def current_guest
      @current_guest ||= Guest.find_by(id: cookies.signed[:guest_id])
    end

    def set_todo_list
      @list = TodoList.find_by_guest_id(current_guest.id)
    end
end
