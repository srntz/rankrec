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

ActiveRecord::Schema[8.0].define(version: 2025_05_09_025641) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "albums", force: :cascade do |t|
    t.text "title"
    t.text "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "artist_id", null: false
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.decimal "score", precision: 3, scale: 1
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "album_id", null: false
    t.index ["album_id"], name: "index_ratings_on_album_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
    t.check_constraint "score >= 0.0 AND score <= 10.0", name: "ratingsscorerangecheck"
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "auth0_sub"
    t.integer "role", default: 0
    t.index ["auth0_sub"], name: "index_users_on_auth0_sub", unique: true
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "ratings", "albums"
  add_foreign_key "ratings", "users"
end
