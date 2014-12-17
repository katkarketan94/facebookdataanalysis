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

ActiveRecord::Schema.define(:version => 20141215061921) do

  create_table "abouts", :force => true do |t|
    t.string   "genre"
    t.string   "page_id"
    t.string   "website"
    t.string   "directed_by"
    t.string   "starring"
    t.string   "author"
    t.integer  "favourite_id"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.string   "category"
    t.text     "description",  :limit => 255
    t.string   "name"
    t.text     "about",        :limit => 255
  end

  add_index "abouts", ["favourite_id"], :name => "index_abouts_on_favourite_id"

  create_table "educations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "school_id"
    t.string   "name"
  end

  create_table "educations_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "education_id"
  end

  create_table "favourites", :force => true do |t|
    t.string   "category"
    t.string   "name"
    t.integer  "favourite_id"
    t.integer  "about_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "favourites", ["about_id"], :name => "index_favourites_on_about_id"

  create_table "favourites_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "favourite_id"
  end

  create_table "interfaces", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "uid"
  end

  create_table "pages_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "page_id"
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "content"
    t.string   "heading"
    t.string   "uid"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "email"
    t.string   "uid"
    t.string   "location"
    t.string   "birthday"
    t.string   "gender"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "hometown"
    t.string   "interested_in"
    t.string   "relationship_status"
    t.string   "religion"
    t.string   "sports"
    t.string   "work"
    t.string   "language"
  end

end
