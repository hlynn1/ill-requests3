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

ActiveRecord::Schema.define(:version => 20120915175710) do

  create_table "activities", :force => true do |t|
    t.integer  "request_id"
    t.integer  "status_id"
    t.date     "date"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["request_id", "created_at"], :name => "index_activities_on_request_id_and_created_at"

  create_table "customers", :force => true do |t|
    t.string   "userid"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "oclcnum"
    t.string   "title"
    t.string   "author"
    t.string   "pub"
    t.string   "locationplaced"
    t.integer  "location_id"
    t.date     "duedate"
    t.integer  "bclitem",        :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "dateplaced"
    t.integer  "current_status"
  end

  create_table "statuses", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "locationcode"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
