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

ActiveRecord::Schema.define(:version => 20130309120147) do

  create_table "users", :force => true do |t|
    t.string   "email",           :limit => 50, :null => false
    t.string   "hashed_password", :limit => 80, :null => false
    t.string   "first_name",      :limit => 50, :null => false
    t.string   "last_name",       :limit => 50, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "vacation_requests", :force => true do |t|
    t.text     "leave_text",                 :null => false
    t.integer  "request_hours", :limit => 2, :null => false
    t.integer  "remain_hours",  :limit => 2, :null => false
    t.integer  "user_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "vacation_requests", ["user_id"], :name => "index_vacation_requests_on_user_id"

  create_table "vacations", :force => true do |t|
    t.integer  "remain_hours", :limit => 2, :default => 120, :null => false
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.integer  "user_id"
  end

  add_index "vacations", ["user_id"], :name => "index_vacations_on_user_id"

end
