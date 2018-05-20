class TodoListsController < ApplicationController

  def show
    @list = TodoList.last || TodoList.create
  end

  def update
    new_todo_list = TodoList.new(title: form_params[:title]) do |list|
      form_params[:todos].each do |param|
        todo = param.last
        list.add(content: todo[:content], done: todo[:done] || false)
      end
    end

    list = TodoList.last
    list.update_with(new_todo_list)
    list.save!

    redirect_to todo_list_url
  end

  private

    def form_params
      params.require(:form).permit(:title, { todos: [:content, :done] })
    end
end
