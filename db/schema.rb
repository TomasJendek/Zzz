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

ActiveRecord::Schema.define(:version => 20130428061154) do

  create_table "ambulance_items", :force => true do |t|
    t.integer  "ambulance_id"
    t.string   "name"
    t.string   "address"
    t.text     "link"
    t.integer  "rating_id"
    t.string   "doctor"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "ambulance_items", ["ambulance_id"], :name => "index_ambulance_items_on_ambulance_id"

  create_table "ambulances", :force => true do |t|
    t.string   "specialization"
    t.integer  "region_id"
    t.string   "link"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "ambulances", ["region_id"], :name => "index_ambulances_on_region_id"

  create_table "ratings", :force => true do |t|
    t.string   "comment"
    t.integer  "value"
    t.integer  "ambulance_item_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "ratings", ["ambulance_item_id"], :name => "index_ratings_on_ambulance_item_id"

  create_table "regions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
