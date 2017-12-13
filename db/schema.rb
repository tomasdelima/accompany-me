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

ActiveRecord::Schema.define(version: 20171213010638) do

  create_table "accompaniments", force: true do |t|
    t.date     "date_time"
    t.string   "place"
    t.string   "subject"
    t.text     "plans"
    t.text     "achievements"
    t.text     "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "accompaniable_id"
    t.string   "accompaniable_type"
  end

  add_index "accompaniments", ["accompaniable_id", "accompaniable_type"], name: "index_accompaniments_on_accompaniable"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "frequency"
    t.date     "last_occurrence"
    t.integer  "accompaniment_frequency"
    t.date     "last_accompanied"
    t.integer  "activitable_id"
    t.string   "activitable_type"
  end

  add_index "activities", ["activitable_id", "activitable_type"], name: "activities_on_activitable"

  create_table "activities_users", force: true do |t|
    t.integer "activity_id"
    t.integer "user_id"
  end

  create_table "experiences", force: true do |t|
    t.text     "description"
    t.date     "occurrence_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "experienceable_id"
    t.string   "experienceable_type"
  end

  add_index "experiences", ["experienceable_id", "experienceable_type"], name: "index_experiences_on_experienceable"

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "contact_id"
  end

  add_index "friendships", ["contact_id"], name: "index_friendships_on_contact_id"
  add_index "friendships", ["friend_id"], name: "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], name: "index_friendships_on_user_id"

  create_table "learnings", force: true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "summary"
    t.integer  "learnable_id"
    t.string   "learnable_type"
  end

  add_index "learnings", ["learnable_id", "learnable_type"], name: "index_learnings_on_learnable"

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
    t.boolean  "signed_up"
    t.string   "phone"
    t.string   "celphone"
    t.string   "address"
    t.string   "name"
    t.text     "observations"
    t.date     "birthdate"
    t.integer  "age"
    t.date     "age_changed_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
