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

ActiveRecord::Schema.define(version: 20151205055331) do

  create_table "clients", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "surname",      limit: 255
    t.string   "patronymic",   limit: 255
    t.string   "email",        limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "user_id",      limit: 4
    t.boolean  "mark_removal",             default: false
    t.integer  "phone",        limit: 4
    t.integer  "passport",     limit: 4
  end

  create_table "loans", force: :cascade do |t|
    t.integer  "sum",        limit: 4
    t.integer  "total_sum",  limit: 4
    t.datetime "end_loan"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "client_id",  limit: 4
    t.datetime "date_issue"
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.integer  "failed_attempts",        limit: 4,   default: 0,     null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "name",                   limit: 255
    t.string   "surname",                limit: 255
    t.string   "patronymic",             limit: 255
    t.boolean  "admin",                              default: false
    t.integer  "territory",              limit: 4
    t.integer  "phone",                  limit: 4
  end

  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
