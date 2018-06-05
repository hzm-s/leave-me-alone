class CreateReminderSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :reminder_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :interval, null: false
    end
  end
end
