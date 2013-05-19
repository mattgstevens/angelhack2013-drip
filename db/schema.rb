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

ActiveRecord::Schema.define(:version => 20130518205223) do

  create_table "auths", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_auths", :force => true do |t|
    t.integer  "user_id"
    t.integer  "auth_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "blood_type"
    t.string   "city"
    t.string   "province"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false

  create_table "clinic_schedules", :force => true do |t|
    t.date    "date"
    t.string  "begin_time"
    t.string  "end_time"
    t.integer "clinic_id"
  end

  create_table "clinics", :force => true do |t|
    t.string "city"
    t.string "building"
    t.string "building_directions"
    t.string "address"
    t.float  "y_coord"
    t.float  "x_coord"
  end

end
