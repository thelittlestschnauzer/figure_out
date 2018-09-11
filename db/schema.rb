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

ActiveRecord::Schema.define(version: 2018_09_11_022437) do

  create_table "meals", force: :cascade do |t|
    t.date "date", null: false
    t.integer "planner_id", null: false
    t.integer "recipe_id", null: false
    t.index ["planner_id"], name: "index_meals_on_planner_id"
    t.index ["recipe_id"], name: "index_meals_on_recipe_id"
  end

  create_table "planners", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_planners_on_user_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

end
