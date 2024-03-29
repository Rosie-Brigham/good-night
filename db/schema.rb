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

ActiveRecord::Schema.define(version: 20141109000224) do

  create_table "drinks", force: true do |t|
    t.string   "name"
    t.integer  "unit"
    t.integer  "calorie"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "nights", force: true do |t|
    t.integer  "user_id"
    t.datetime "starttime"
    t.datetime "endtime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sm_wine_no"
    t.integer  "me_wine_no"
    t.integer  "lg_wine_no"
    t.integer  "pint_beer_no"
    t.integer  "bottle_beer_no"
    t.integer  "half_beer_no"
    t.integer  "single_spirit_no"
    t.integer  "double_spirit_no"
    t.integer  "pop_no"
    t.integer  "running_calories"
    t.integer  "running_time"
  end

  create_table "users", force: true do |t|
    t.integer  "age"
    t.string   "email"
    t.integer  "weight"
    t.string   "gender"
    t.datetime "do"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "night_id"
    t.datetime "targettime"
  end

end
