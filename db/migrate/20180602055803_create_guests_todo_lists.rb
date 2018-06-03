class CreateGuestsTodoLists < ActiveRecord::Migration[5.2]
  def change
    create_table :guests_todo_lists do |t|
      t.references :guest, null: false, foreign_key: true
      t.references :todo_list, null: false
    end
  end
end
