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

ActiveRecord::Schema.define(version: 20171220031322) do

  create_table "accompaniments", force: :cascade do |t|
    t.date "date_time"
    t.string "place", limit: 255
    t.string "subject", limit: 255
    t.text "plans"
    t.text "achievements"
    t.text "observations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "accompaniable_id"
    t.string "accompaniable_type", limit: 255
    t.index ["accompaniable_id", "accompaniable_type"], name: "index_accompaniments_on_accompaniable"
  end

  create_table "activities", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "frequency", limit: 255
    t.date "last_occurrence"
    t.integer "accompaniment_frequency"
    t.date "last_accompanied"
    t.integer "activitable_id"
    t.string "activitable_type", limit: 255
    t.index ["activitable_id", "activitable_type"], name: "activities_on_activitable"
  end

  create_table "activities_users", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "user_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.text "description"
    t.date "occurrence_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "experienceable_id"
    t.string "experienceable_type", limit: 255
    t.index ["experienceable_id", "experienceable_type"], name: "index_experiences_on_experienceable"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "contact_id"
    t.index ["contact_id"], name: "index_friendships_on_contact_id"
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "learnings", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "summary", limit: 255
    t.integer "learnable_id"
    t.string "learnable_type", limit: 255
    t.index ["learnable_id", "learnable_type"], name: "index_learnings_on_learnable"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.boolean "signed_up"
    t.string "phone", limit: 255
    t.string "celphone", limit: 255
    t.string "address", limit: 255
    t.string "name", limit: 255
    t.text "observations"
    t.date "birthdate"
    t.integer "age"
    t.date "age_changed_at"
    t.string "facebook_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
