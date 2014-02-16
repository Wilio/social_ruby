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

ActiveRecord::Schema.define(version: 20140204192539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentifications", force: true do |t|
    t.integer  "user_id",    null: false
    t.text     "auth_key",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clubs", force: true do |t|
    t.string   "name",        limit: 50, null: false
    t.text     "description"
    t.string   "stylesheet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clubs", ["name"], name: "index_clubs_on_name", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "post_id",    null: false
    t.integer  "comment_id", null: false
    t.text     "content",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title",      limit: 75, null: false
    t.text     "content",               null: false
    t.integer  "user_id",               null: false
    t.integer  "club_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.string   "name",       limit: 30, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags_clubs", id: false, force: true do |t|
    t.integer "tag_id",  null: false
    t.integer "club_id", null: false
  end

  create_table "tags_posts", id: false, force: true do |t|
    t.integer "tag_id",  null: false
    t.integer "post_id", null: false
  end

  create_table "user_powers", force: true do |t|
    t.string "name",        limit: 50, null: false
    t.text   "description",            null: false
  end

  create_table "users", force: true do |t|
    t.string   "username",   limit: 20, null: false
    t.text     "password",              null: false
    t.text     "email",                 null: false
    t.string   "country",    limit: 70
    t.date     "birthday"
    t.text     "salt",                  null: false
    t.boolean  "is_auth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["username", "email"], name: "index_users_on_username_and_email", unique: true, using: :btree

  create_table "users_clubs", id: false, force: true do |t|
    t.integer "user_id",       null: false
    t.integer "club_id",       null: false
    t.integer "user_power_id", null: false
  end

end
