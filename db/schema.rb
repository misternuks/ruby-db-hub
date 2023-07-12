# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_12_111252) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movie_bookmarks", force: :cascade do |t|
    t.string "comment"
    t.bigint "movie_movie_id", null: false
    t.bigint "movie_list_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_list_id"], name: "index_movie_bookmarks_on_movie_list_id"
    t.index ["movie_movie_id"], name: "index_movie_bookmarks_on_movie_movie_id"
  end

  create_table "movie_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_movies", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.string "image_url"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plan_tasks", force: :cascade do |t|
    t.string "title"
    t.text "details"
    t.integer "time"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "completed", default: false
    t.index ["user_id"], name: "index_plan_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "movie_bookmarks", "movie_lists"
  add_foreign_key "movie_bookmarks", "movie_movies"
  add_foreign_key "plan_tasks", "users"
end
