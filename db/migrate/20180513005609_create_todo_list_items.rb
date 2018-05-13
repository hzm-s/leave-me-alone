class CreateTodoListItems < ActiveRecord::Migration[5.2]
  def change
    create_table :todo_list_items do |t|
      t.references :todo_list, null: false, foreign_key: true
      t.string :todo, null: false
      t.string :status, null: false

      t.timestamps
    end
  end
end
