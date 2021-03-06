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

ActiveRecord::Schema.define(version: 20131218110115) do

  create_table "ads", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.float    "starting_price"
    t.float    "buy_now_price"
    t.date     "ends"
    t.boolean  "active"
    t.boolean  "mailed"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "postcode"
    t.string   "city"
    t.integer  "winner_id"
  end

  create_table "bids", force: true do |t|
    t.integer  "user_id"
    t.integer  "ad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "highest"
  end

  create_table "cars", force: true do |t|
    t.string   "fuel_type"
    t.string   "age"
    t.string   "color"
    t.string   "engine"
    t.string   "image_url"
    t.string   "hp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ad_id"
    t.integer  "make_id"
    t.integer  "model_id"
    t.string   "style"
  end

  create_table "images", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ad_id"
    t.string   "carphoto"
  end

  create_table "makes", force: true do |t|
    t.integer  "car_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "content"
    t.integer  "to_id"
    t.integer  "from_id"
    t.integer  "reply_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ad_id"
  end

  create_table "models", force: true do |t|
    t.integer  "make_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "car_id"
  end

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "bio"
  end

  create_table "ratings", force: true do |t|
    t.text     "comment"
    t.integer  "rate"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "picture_url"
    t.string   "google_token"
    t.string   "google_id"
    t.string   "nick"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
