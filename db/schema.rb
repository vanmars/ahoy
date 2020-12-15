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

ActiveRecord::Schema.define(version: 2020_12_15_231457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "board_outlines", id: false, force: :cascade do |t|
    t.bigint "board_id"
    t.bigint "outline_id"
    t.index ["board_id"], name: "index_board_outlines_on_board_id"
    t.index ["outline_id"], name: "index_board_outlines_on_outline_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "outline_id_1"
    t.string "outline_id_2"
  end

  create_table "cards", force: :cascade do |t|
    t.string "text"
    t.string "color"
    t.integer "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "outlines", force: :cascade do |t|
    t.string "claim_1"
    t.string "evidence_1a"
    t.string "evidence_1b"
    t.string "close_call_1"
    t.string "red_herring_1"
    t.string "claim_2"
    t.string "evidence_2a"
    t.string "evidence_2b"
    t.string "close_call_2"
    t.string "red_herring_2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "name"
  end

  create_table "randoms", force: :cascade do |t|
    t.string "book_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
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

  add_foreign_key "cards", "boards"
  add_foreign_key "outlines", "users"
end
