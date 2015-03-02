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

ActiveRecord::Schema.define(version: 20150222042109) do

  create_table "contact_pages", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "contact_me"
    t.string   "reason_selected"
    t.text     "question"
    t.string   "subscribe_newsletter"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "answer"
    t.boolean  "published"
  end

  create_table "matchmakers", force: true do |t|
    t.integer  "featured_user_id"
    t.integer  "candidate_id"
    t.integer  "votes",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", force: true do |t|
    t.integer  "author_id"
    t.integer  "receiver_id"
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "surveys", force: true do |t|
    t.string   "question_one"
    t.string   "question_two"
    t.string   "question_three"
    t.string   "question_four"
    t.string   "question_five"
    t.string   "question_six"
    t.string   "question_seven"
    t.string   "question_eight"
    t.string   "question_nine"
    t.string   "question_ten"
    t.string   "question_eleven"
    t.string   "question_twelve"
    t.string   "question_thirteen"
    t.string   "question_fourteen"
    t.string   "question_fifthteen"
    t.string   "question_sixteen"
    t.string   "question_seventeen"
    t.string   "question_eighteen"
    t.string   "question_nineteen"
    t.string   "question_twenty"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "surveys", ["user_id"], name: "index_surveys_on_user_id", unique: true

  create_table "users", force: true do |t|
    t.string   "password"
    t.string   "userName"
    t.string   "firstName"
    t.string   "lastName"
    t.date     "birthdate"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.text     "about"
    t.string   "gender"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "survey"
    t.string   "avatar"
    t.string   "thumbnail"
    t.boolean  "voted",                  default: false
    t.string   "cover"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
