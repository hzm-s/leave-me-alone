# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_27_015502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "google_identities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "sub", null: false
    t.datetime "created_at", null: false
    t.index ["sub"], name: "index_google_identities_on_sub", unique: true
    t.index ["user_id"], name: "index_google_identities_on_user_id"
  end

  create_table "todo_lists", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.bigint "todo_list_id", null: false
    t.string "content", null: false
    t.boolean "done", default: false, null: false
    t.index ["todo_list_id"], name: "index_todos_on_todo_list_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "avatar_url", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "signed_up_at", null: false
  end

  add_foreign_key "google_identities", "users"
  add_foreign_key "todos", "todo_lists"
  add_foreign_key "user_profiles", "users"
end
