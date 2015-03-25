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

ActiveRecord::Schema.define(version: 20150305222659) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "restaurants", force: :cascade do |t|
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.string   "url",                    default: "unavailable", null: false
    t.string   "mobile_url",             default: "unavailable", null: false
    t.string   "display_phone",          default: "unavailable", null: false
    t.string   "categories",             default: "unavailable", null: false
    t.string   "name",                   default: "unavailable", null: false
    t.string   "display_address",        default: "unavailable", null: false
    t.string   "image_url",              default: "unavailable", null: false
    t.float    "lat",                    default: 0.0,           null: false
    t.float    "lng",                    default: 0.0,           null: false
    t.float    "rating",                 default: 0.0,           null: false
    t.string   "neighborhoods",          default: "unavailable", null: false
    t.string   "yelp_id",                default: "unavailable", null: false
    t.string   "brunch_days",            default: "unavailable", null: false
    t.integer  "btm_price"
    t.string   "rating_image_url",       default: "unavailable"
    t.string   "rating_image_url_large", default: "unavailable"
    t.string   "rating_image_url_small", default: "unavailable"
    t.time     "btm_start_time"
    t.time     "btm_end_time"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "body",          null: false
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.integer  "rating"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "username"
    t.boolean  "guest"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
