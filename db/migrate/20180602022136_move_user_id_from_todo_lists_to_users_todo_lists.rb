class MoveUserIdFromTodoListsToUsersTodoLists < ActiveRecord::Migration[5.2]
  def up
    remove_foreign_key :todo_lists, :users
    execute <<-SQL
      INSERT INTO users_todo_lists (user_id, todo_list_id) SELECT user_id, id FROM todo_lists
    SQL
    remove_column :todo_lists, :user_id
  end

  def down
    add_column :todo_lists, :user_id, :integer
    execute <<-SQL
      UPDATE
        todo_lists
      SET
        user_id = users_todo_lists.user_id
      FROM
        users_todo_lists
      WHERE
        todo_lists.id = users_todo_lists.todo_list_id
    SQL
    add_foreign_key :todo_lists, :users
  end
end
