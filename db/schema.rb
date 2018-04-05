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

ActiveRecord::Schema.define(version: 20180405233334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.integer "meal_posting_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_meal_postings", id: false, force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "meal_posting_id", null: false
    t.index ["category_id", "meal_posting_id"], name: "category_meal_id"
    t.index ["meal_posting_id", "category_id"], name: "meal_category_id"
  end

  create_table "meal_postings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "category_id"
    t.integer "base_time"
    t.integer "end_time"
    t.string "title"
    t.text "description"
    t.string "allergy_notice"
    t.integer "servings"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_ratings", force: :cascade do |t|
    t.integer "meal_posting_id"
    t.integer "user_id"
    t.text "comment"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media", force: :cascade do |t|
    t.integer "meal_posting_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "meal_posting_id"
    t.integer "user_id"
    t.integer "number_of_people"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_ratings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ratee_id"
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_status"
    t.string "address"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "phone_number"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "categories", "meal_postings"
  add_foreign_key "meal_postings", "categories"
  add_foreign_key "meal_postings", "users"
  add_foreign_key "meal_ratings", "meal_postings"
  add_foreign_key "meal_ratings", "users"
  add_foreign_key "media", "meal_postings"
  add_foreign_key "reservations", "meal_postings"
  add_foreign_key "reservations", "users"
  add_foreign_key "user_ratings", "users"
end
