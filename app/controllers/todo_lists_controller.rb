class TodoListsController < ApplicationController
  layout 'todo_list'

  before_action :require_user

  def show
    @list = TodoList.find_by_user_id(current_user.id)
  end

  def update
    new_todo_list = TodoList.new(title: form_params[:title]) do |list|
      todo_params.each do |todo|
        list.add(content: todo[:content], done: todo[:done] || false)
      end
    end

    @list = TodoList.last
    @list.update_with(new_todo_list)
    @list.save!
  end

  private

    def form_params
      params.require(:form).permit(:title, { todos: [:content, :done] })
    end

    def todo_params
      return [] unless form_params[:todos]
      form_params[:todos].keys.map { |k| form_params[:todos][k] }
    end
end
