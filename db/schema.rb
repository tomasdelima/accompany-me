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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160206023310) do

  create_table "accompaniments", force: true do |t|
    t.integer  "activity_id"
    t.integer  "friend_id"
    t.datetime "date_time"
    t.string   "place"
    t.string   "subject"
    t.text     "plans"
    t.text     "achievements"
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accompaniments", ["activity_id"], name: "index_accompaniments_on_activity_id"
  add_index "accompaniments", ["friend_id"], name: "index_accompaniments_on_friend_id"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organizer_id"
    t.string   "frequency"
    t.datetime "last_occurrence"
    t.integer  "user_id"
    t.integer  "accompaniment_frequency"
    t.datetime "last_accompanied"
  end

  add_index "activities", ["organizer_id"], name: "index_activities_on_organizer_id"
  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "activities_friends", id: false, force: true do |t|
    t.integer "activity_id"
    t.integer "friend_id"
  end

  create_table "experiences", force: true do |t|
    t.text     "description"
    t.date     "occurrence_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "name"
    t.boolean  "declared"
    t.date     "last_accompanied"
    t.integer  "accompaniment_frequency"
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id"

  create_table "learnings", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "related_to_id"
    t.string   "related_to_type"
    t.integer  "owner_id"
    t.string   "summary"
  end

  add_index "learnings", ["owner_id"], name: "index_learnings_on_owner_id"
  add_index "learnings", ["related_to_id", "related_to_type"], name: "index_learnings_on_related_to_id_and_related_to_type"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
