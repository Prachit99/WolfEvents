# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_11_202128) do
  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "name"
    t.string "phone"
    t.string "address"
    t.string "credit_card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attendees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.string "phone"
    t.string "address"
    t.string "credit_card"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_tickets", force: :cascade do |t|
    t.string "confirmation_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "event_name"
    t.string "event_cat"
    t.date "event_date"
    t.datetime "event_start_time"
    t.datetime "event_end_time"
    t.decimal "ticket_price"
    t.integer "no_of_seats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.decimal "rating"
    t.string "feedback"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_loc"
    t.integer "room_cap"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
