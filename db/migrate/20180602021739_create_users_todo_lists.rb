class CreateUsersTodoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :users_todo_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :todo_list, null: false, foreign_key: true
    end
  end
end
