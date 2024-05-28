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

ActiveRecord::Schema[7.1].define(version: 2024_05_26_054040) do
  create_table "artists", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artists_on_name", unique: true
  end

  create_table "diaries", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "jazz_cafe_id"
    t.integer "record_id"
    t.index ["jazz_cafe_id"], name: "index_diaries_on_jazz_cafe_id"
    t.index ["record_id"], name: "index_diaries_on_record_id"
  end

  create_table "jazz_cafes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "artist_id"
    t.index ["artist_id"], name: "index_records_on_artist_id"
    t.index ["title", "artist_id"], name: "index_records_on_title_and_artist_id", unique: true
  end

  add_foreign_key "diaries", "jazz_cafes"
  add_foreign_key "diaries", "records"
  add_foreign_key "records", "artists"
end
