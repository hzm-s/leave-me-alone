module TodoListFormHelper
  private

    def build_new_todo_list(p)
      list = TodoList.new(title: p[:title])
      todo_params(p).each do |todo|
        list.add(content: todo[:content], done: todo[:done] || false)
      end
      list
    end

    def todo_params(p)
      return [] unless p[:todos]
      p[:todos].keys.map { |k| p[:todos][k] }
    end

    def form_params
      params.require(:form).permit(:title, { todos: [:content, :done] })
    end
end
