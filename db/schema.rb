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

ActiveRecord::Schema.define(version: 20170408075114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "session_id"
    t.string   "status",     default: "pending", null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["session_id"], name: "index_bookings_on_session_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "volunteer_id"
    t.string   "category",                    null: false
    t.string   "title",                       null: false
    t.string   "description",                 null: false
    t.string   "language",     default: "en", null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["volunteer_id"], name: "index_courses_on_volunteer_id", using: :btree
  end

  create_table "images", force: :cascade do |t|
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "public_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_images_on_owner_type_and_owner_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "sender_id",   null: false
    t.integer  "receiver_id", null: false
    t.text     "body",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "start",      null: false
    t.datetime "end",        null: false
    t.integer  "capacity",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email",                          null: false
    t.string "session_token",                  null: false
    t.string "password_digest",                null: false
    t.string "first_name",                     null: false
    t.string "last_name",                      null: false
    t.string "language",        default: "en", null: false
    t.string "about",                          null: false
  end

end
