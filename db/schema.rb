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

ActiveRecord::Schema.define(:version => 20120922160848) do

  create_table "bids", :force => true do |t|
    t.datetime "bid_start_time"
    t.datetime "bid_end_time"
    t.integer  "bid_tax"
    t.integer  "bid_unit_cost"
    t.string   "transaction_status"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "product_id"
    t.integer  "winner_user_id"
  end

  create_table "products", :force => true do |t|
    t.string   "product_name"
    t.integer  "product_price"
    t.string   "product_description"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "user_bids", :force => true do |t|
    t.datetime "time"
    t.integer  "user_price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "bid_id"
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "user_name"
    t.string   "user_id_card_number"
    t.string   "user_realname"
    t.integer  "user_yob"
    t.string   "user_phone"
    t.string   "user_address"
    t.string   "user_email"
    t.integer  "user_balance"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
