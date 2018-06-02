class TodoListsController < ApplicationController
  include TodoListFormHelper

  layout 'todo_list'

  before_action :require_user
  before_action :set_todo_list

  def update
    new_todo_list = build_new_todo_list(form_params)
    @list.update_with(new_todo_list)
    @list.save!
  end

  private

    def set_todo_list
      @list = TodoList.find_by_user_id(current_user.id)
    end
end
