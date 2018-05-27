class CreateUserProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :avatar_url, null: false
      t.datetime :updated_at, null: false
    end
  end
end
