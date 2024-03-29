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

ActiveRecord::Schema.define(version: 20140215184852) do

  create_table "comments", force: true do |t|
    t.string   "body"
    t.integer  "idea_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["idea_id"], name: "index_comments_on_idea_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "ideas", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "status"
    t.integer  "vote_score"
    t.integer  "hit_counter"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id"

  create_table "participations", force: true do |t|
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participations", ["idea_id"], name: "index_participations_on_idea_id"
  add_index "participations", ["user_id"], name: "index_participations_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: true do |t|
    t.boolean  "is_up",      default: false
    t.integer  "user_id"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["idea_id"], name: "index_votes_on_idea_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end
