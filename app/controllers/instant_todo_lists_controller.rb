class InstantTodoListsController < ApplicationController
  layout 'todo_list'

  before_action :require_guest, only: [:show]
  before_action :register_guest, only: [:show]
  before_action :set_todo_list

  def show
    @instant_mode = true
    render 'todo_lists/show'
  end

  def update
    new_todo_list = TodoList.new(title: form_params[:title]) do |list|
      todo_params.each do |todo|
        list.add(content: todo[:content], done: todo[:done] || false)
      end
    end

    @list.update_with(new_todo_list)
    @list.save!
  end

  private

    def register_guest
      @current_guest = RegisterGuestCommand.run!.guest
      cookies.signed[:guest_id] = @current_guest.id
    end

    def current_guest
      @current_guest ||= Guest.find(cookies.signed[:guest_id])
    end

    def set_todo_list
      @list = TodoList.find_by_guest_id(current_guest.id)
    end

    def form_params
      params.require(:form).permit(:title, { todos: [:content, :done] })
    end

    def todo_params
      return [] unless form_params[:todos]
      form_params[:todos].keys.map { |k| form_params[:todos][k] }
    end
end
