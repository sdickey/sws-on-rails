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

ActiveRecord::Schema.define(version: 20140921145950) do

  create_table "accounts", force: true do |t|
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "email"
    t.integer  "keys_on_file",  default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emergency_contacts", force: true do |t|
    t.string   "emerg_first_name"
    t.string   "emerg_last_name"
    t.string   "emerg_hphone"
    t.string   "emerg_wphone"
    t.string   "emerg_cphone"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "owners", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "number_and_street"
    t.string   "unit"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "home_phone"
    t.string   "work_phone"
    t.string   "cell_phone"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pets", force: true do |t|
    t.string   "name"
    t.string   "kind"
    t.string   "breed"
    t.integer  "age"
    t.string   "birth_month"
    t.text     "health_history"
    t.text     "current_health"
    t.string   "med_name"
    t.text     "med_administer"
    t.string   "med_dose"
    t.text     "med_frequency"
    t.text     "food_instructions"
    t.text     "visit_instructions"
    t.text     "behavior"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
