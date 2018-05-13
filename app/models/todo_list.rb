class TodoList < ApplicationRecord
  has_many :items, class_name: 'TodoListItem'

  def add(todo)
    self.items.build(todo: todo)
  end

  def rewrite(index, todo)
    self.items[index].todo = todo
  end

  def mark_as_done(index)
    self.items[index].mark_as_done
  end

  def mark_as_todo(index)
    self.items[index].mark_as_todo
  end

  def remove(index)
    target = self.items.detect.with_index { |_, i| i == index }
    self.items.destroy(target)
  end

  def remove_all
    items.each_with_index { |_, i| remove(i) }
    items.reload
  end
end
