class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.references :todo_list, null: false, foreign_key: true
      t.string :content, null: false
      t.boolean :done, null: false, default: false
    end
  end
end
