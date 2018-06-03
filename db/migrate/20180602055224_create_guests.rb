class CreateGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.datetime :registered_at, null: false
    end
  end
end
