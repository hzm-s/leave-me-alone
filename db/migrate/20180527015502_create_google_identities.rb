class CreateGoogleIdentities < ActiveRecord::Migration[5.2]
  def change
    create_table :google_identities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :sub, null: false, index: { unique: true }
      t.datetime :created_at, null: false
    end
  end
end
