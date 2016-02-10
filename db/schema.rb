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

ActiveRecord::Schema.define(version: 20160210060234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "semester"
    t.datetime "time"
    t.integer  "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feed_items", force: :cascade do |t|
    t.string   "item_type"
    t.string   "title"
    t.string   "body"
    t.datetime "timestamp"
    t.string   "link"
    t.string   "status"
    t.text     "recipients"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "permissions"
    t.string   "member_email"
  end

  create_table "feed_pushes", force: :cascade do |t|
    t.integer  "feed_item_id"
    t.text     "response"
    t.string   "member_email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "feed_responses", force: :cascade do |t|
    t.integer "feed_item_id"
    t.string  "member_email"
    t.string  "response_type"
  end

  create_table "go_link_clicks", force: :cascade do |t|
    t.string   "member_email"
    t.string   "key"
    t.string   "golink_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "go_links", force: :cascade do |t|
    t.string   "key"
    t.string   "url"
    t.string   "member_email"
    t.string   "description"
    t.string   "title"
    t.integer  "num_clicks"
    t.datetime "timestamp"
    t.string   "permissions"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "semester"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "committee"
    t.string   "position"
    t.string   "major"
    t.string   "year"
    t.string   "latest_semester"
    t.string   "role"
    t.text     "commitments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gcm_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "notification_type"
    t.integer  "object_id"
    t.datetime "timestamp"
    t.text     "channels"
    t.string   "sender"
    t.text     "content"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "member_email"
    t.string   "semester"
    t.string   "position"
    t.string   "committee"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "post_comments", force: :cascade do |t|
    t.integer  "post_id"
    t.string   "member_email"
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "edit_permissions"
    t.string   "view_permissions"
    t.string   "folder"
    t.text     "content"
    t.datetime "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "semester"
    t.string   "last_editor"
    t.text     "tags"
    t.integer  "num_comments"
    t.string   "link"
  end

  create_table "reminders", force: :cascade do |t|
    t.string   "title"
    t.string   "link"
    t.string   "body"
    t.string   "member_email"
    t.string   "author"
    t.string   "reminder_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tabling_slots", force: :cascade do |t|
    t.integer  "time"
    t.text     "member_emails"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tabling_switch_requests", force: :cascade do |t|
    t.string   "email1"
    t.string   "email2"
    t.string   "switch_status"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
