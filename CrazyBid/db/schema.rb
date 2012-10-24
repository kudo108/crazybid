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

ActiveRecord::Schema.define(:version => 20121024135135) do

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
    t.binary   "image"
  end

  create_table "user_bids", :force => true do |t|
    t.datetime "time"
    t.integer  "user_price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "bid_id"
    t.integer  "user_id"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'attachment' for column 'avatar'

end
