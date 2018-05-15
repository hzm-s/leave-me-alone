class TodoList < ApplicationRecord
  has_many :items, -> { order(:id) }, class_name: 'TodoListItem'

  after_update { self.items.each(&:save!) }

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
    items.each_with_index do |item, i|
      item.destroy if i == index
    end
  end

  def remove_all
    items.each_with_index { |_, i| remove(i) }
  end

  def remove_done_items
    items.each_with_index do |item, i|
      remove(i) if item.done?
    end
  end
end
