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

ActiveRecord::Schema.define(:version => 20150102112702) do

  create_table "leagues", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "providers", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "team_matches", :force => true do |t|
    t.integer  "team_a_id",    :null => false
    t.integer  "team_b_id",    :null => false
    t.boolean  "status"
    t.string   "title"
    t.string   "location"
    t.integer  "result"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "team_a_score"
    t.integer  "team_b_score"
    t.date     "date"
    t.time     "time"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.string   "crest"
    t.string   "location"
    t.integer  "league_id"
    t.integer  "wins",       :default => 0
    t.integer  "losses",     :default => 0
    t.integer  "points",     :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "draws",      :default => 0
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.text     "image"
    t.string   "name"
    t.string   "username"
    t.integer  "team_id"
    t.string   "position"
    t.date     "dob"
    t.float    "height"
    t.string   "location"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
