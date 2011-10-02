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

ActiveRecord::Schema.define(:version => 20110929230153) do

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "vehicles", :force => true do |t|
    t.integer  "year"
    t.string   "make"
    t.string   "model"
    t.string   "style"
    t.integer  "mileage"
    t.string   "state"
    t.string   "city"
    t.float    "sale_price"
    t.string   "photo_URL"
    t.string   "status"
    t.string   "short_description"
    t.text     "details"
    t.string   "vehicle_type"
    t.string   "license_plate"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.string   "contact_email"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
