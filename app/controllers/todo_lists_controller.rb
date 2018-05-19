class TodoListsController < ApplicationController
  List = Struct.new(:title, :items)
  ListItem = Struct.new(:content)

  def show
    @list = List.new(
      'Todo',
      [
        ListItem.new('Alpha'),
        ListItem.new('Bravo'),
        ListItem.new('Charlie'),
        ListItem.new('Delta'),
        ListItem.new('Echo'),
      ]
    )
  end
end
