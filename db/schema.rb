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

ActiveRecord::Schema.define(version: 0) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "anonymous", id: false, force: true do |t|
    t.text "crypted_id"
    t.text "salt"
  end

  create_table "comments", id: false, force: true do |t|
    t.integer "comment_id",                 null: false
    t.integer "user_id"
    t.boolean "anonymous",  default: false
    t.integer "parent_id"
    t.text    "content"
  end

  create_table "users", id: false, force: true do |t|
    t.integer "user_id",               null: false
    t.string  "username",  limit: 20
    t.string  "password",  limit: 100
    t.string  "email",     limit: 50
    t.date    "join_date"
    t.string  "location",  limit: 50
    t.string  "website",   limit: 90
    t.date    "birthday"
  end

end
