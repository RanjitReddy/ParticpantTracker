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

ActiveRecord::Schema.define(version: 2023_05_22_111638) do

  create_table "coordinators", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_coordinators_on_email", unique: true
  end

  create_table "participants", force: :cascade do |t|
    t.string "name", null: false
    t.string "gender", null: false
    t.date "date_of_birth", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "method_of_contact", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registries", force: :cascade do |t|
    t.string "name", null: false
    t.string "location", null: false
    t.string "status", default: "Open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "location"], name: "index_registries_on_name_and_location", unique: true
  end

  create_table "registry_coordinators", force: :cascade do |t|
    t.integer "registry_id", null: false
    t.string "coordinator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registry_participants", force: :cascade do |t|
    t.integer "participant_id", null: false
    t.integer "registry_id", null: false
    t.string "coordinator_email", null: false
    t.date "enrollment_date", null: false
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id", "registry_id"], name: "index_registry_participants_on_participant_id_and_registry_id", unique: true
  end

end
