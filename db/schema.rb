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

ActiveRecord::Schema.define(:version => 20130709221319) do

  create_table "auction_participations", :force => true do |t|
    t.integer "user_id"
    t.integer "auction_id"
    t.string  "state"
  end

  create_table "auctions", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "start_price",                 :precision => 8, :scale => 2
    t.decimal  "end_price",                   :precision => 8, :scale => 2
    t.decimal  "current_price",               :precision => 8, :scale => 2
    t.decimal  "store_price",                 :precision => 8, :scale => 2
    t.integer  "start_quantity"
    t.integer  "current_quantity"
    t.integer  "minimum_users_per_product"
    t.integer  "maximum_users_per_product"
    t.integer  "time_for_purchase"
    t.integer  "active_users_timeout"
    t.decimal  "price_reduce_amount"
    t.integer  "price_reduce_pace"
    t.datetime "next_price_reduce_at"
    t.datetime "wait_for_active_users_until"
    t.datetime "start_datetime"
    t.string   "state"
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "amount"
    t.string   "state"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "name"
    t.string   "surname"
    t.string   "state"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
