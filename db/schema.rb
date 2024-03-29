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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130212184821) do

  create_table "body_type_dresses", :force => true do |t|
    t.integer "dress_id"
    t.integer "body_type_id"
  end

  create_table "body_types", :force => true do |t|
    t.string "label"
  end

  create_table "dresses", :force => true do |t|
    t.integer "owner_id"
    t.string  "brand"
    t.string  "size"
    t.string  "color"
    t.text    "notes"
    t.integer "rent"
    t.binary  "photo_blob"
  end

  add_index "dresses", ["owner_id"], :name => "index_dresses_on_owner_id"
  add_index "dresses", ["rent"], :name => "index_dresses_on_rent"
  add_index "dresses", ["size"], :name => "index_dresses_on_size"

  create_table "rentals", :force => true do |t|
    t.integer "user_id"
    t.integer "dress_id"
    t.date    "start_date"
    t.date    "end_date"
  end

  add_index "rentals", ["dress_id"], :name => "index_rentals_on_dress_id"
  add_index "rentals", ["user_id"], :name => "index_rentals_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "points"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "session_token"
    t.string   "apikey"
  end

  add_index "users", ["last_name"], :name => "index_users_on_last_name"

end
