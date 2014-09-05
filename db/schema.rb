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

ActiveRecord::Schema.define(version: 20140905173300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bets", force: true do |t|
    t.string   "challenge"
    t.float    "amount"
    t.date     "challenge_start"
    t.date     "challenge_end"
    t.integer  "winner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_accepted"
    t.integer  "challenger"
    t.integer  "challengee"
    t.string   "workflow_state"
  end

  create_table "user_bets", force: true do |t|
    t.integer  "bet_id"
    t.integer  "user_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_bets", ["bet_id"], name: "index_user_bets_on_bet_id", using: :btree
  add_index "user_bets", ["user_id"], name: "index_user_bets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "display_name"
    t.boolean  "is_friend"
    t.integer  "friends_count"
    t.string   "about"
    t.string   "email"
    t.string   "phone"
    t.string   "profile_picture_url"
    t.string   "friend_request"
    t.boolean  "trust_request"
    t.string   "venmo_id"
    t.date     "date_joined"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venmos", force: true do |t|
    t.string   "username"
    t.integer  "made_bets"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
