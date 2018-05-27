class CreateTodoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.datetime :updated_at, null: false
    end
  end
end
