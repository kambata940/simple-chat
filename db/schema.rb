# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160506155540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cards", force: :cascade do |t|
    t.string  "color",  null: false
    t.integer "number", null: false
  end

  create_table "chat_rooms", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "poker_table_id", null: false
  end

  add_index "chat_rooms", ["poker_table_id"], name: "index_chat_rooms_on_poker_table_id", using: :btree

  create_table "flops", force: :cascade do |t|
    t.integer "hand_histories_id"
    t.string  "first_card",        null: false
    t.string  "second_card",       null: false
    t.string  "third_card",        null: false
  end

  add_index "flops", ["hand_histories_id"], name: "index_flops_on_hand_histories_id", using: :btree

  create_table "hand_histories", force: :cascade do |t|
    t.integer  "poker_table_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "hand_histories", ["poker_table_id"], name: "index_hand_histories_on_poker_table_id", using: :btree

  create_table "hand_players", force: :cascade do |t|
    t.integer "hand_histories_id"
    t.integer "user_id"
    t.string  "position"
    t.string  "first_card"
    t.string  "second_card"
  end

  add_index "hand_players", ["hand_histories_id"], name: "index_hand_players_on_hand_histories_id", using: :btree
  add_index "hand_players", ["user_id"], name: "index_hand_players_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "user_name",    null: false
    t.string   "content"
    t.integer  "chat_room_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["chat_room_id"], name: "index_messages_on_chat_room_id", using: :btree

  create_table "moves", force: :cascade do |t|
    t.string  "stage_type"
    t.integer "stage_id"
    t.integer "user_id"
    t.string  "action"
    t.float   "value"
  end

  create_table "poker_tables", force: :cascade do |t|
    t.boolean  "active",     null: false
    t.float    "sb_size",    null: false
    t.float    "bb_size",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preflops", force: :cascade do |t|
    t.integer "hand_histories_id"
  end

  add_index "preflops", ["hand_histories_id"], name: "index_preflops_on_hand_histories_id", using: :btree

  create_table "rivers", force: :cascade do |t|
    t.integer "hand_histories_id"
    t.string  "first_card",        null: false
  end

  add_index "rivers", ["hand_histories_id"], name: "index_rivers_on_hand_histories_id", using: :btree

  create_table "turns", force: :cascade do |t|
    t.integer "hand_histories_id"
    t.string  "first_card",        null: false
  end

  add_index "turns", ["hand_histories_id"], name: "index_turns_on_hand_histories_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "chat_rooms", "poker_tables", name: "chat_room_poker_table_id_fk"
  add_foreign_key "hand_histories", "poker_tables", name: "hand_history_poker_table_id_fk"
  add_foreign_key "messages", "chat_rooms", name: "message_chat_room_id_fk"
end
