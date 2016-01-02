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

ActiveRecord::Schema.define(version: 20160102011130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name",       default: "Default Account", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_hackers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hacker_id"
    t.integer  "user_id"
  end

  create_table "hackers", force: true do |t|
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.text     "first_name"
    t.text     "last_name"
    t.text     "email"
    t.boolean  "is_over_18"
    t.string   "gender"
    t.text     "school"
    t.text     "major"
    t.string   "graduation_date"
    t.text     "learn",                        default: [],              array: true
    t.text     "experience",                   default: [],              array: true
    t.string   "num_of_hackathons"
    t.boolean  "returner"
    t.text     "github"
    t.text     "linkedin"
    t.text     "resume"
    t.text     "dietary_restrictions"
    t.boolean  "require_travel_reimbursement"
    t.text     "emergency_contact_name"
    t.text     "emergency_contact_number"
    t.boolean  "hireable"
    t.text     "avatar"
  end

  create_table "stats", force: true do |t|
    t.integer  "hacker_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "num_of_github_repos"
    t.json     "github_languages"
    t.json     "linkedin_experience"
  end

  add_index "stats", ["hacker_id"], name: "index_stats_on_hacker_id", using: :btree

  create_table "statuses", force: true do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "status"
    t.integer  "hacker_id"
    t.datetime "invitation_sent_at"
    t.string   "invitation_key"
    t.datetime "decision_made_at"
    t.string   "decision"
  end

  add_index "statuses", ["hacker_id"], name: "index_statuses_on_hacker_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "account_id"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
