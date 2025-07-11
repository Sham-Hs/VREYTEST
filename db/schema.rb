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

ActiveRecord::Schema[8.0].define(version: 2025_06_23_221926) do
  create_table "measurements", force: :cascade do |t|
    t.integer "meter_id", null: false
    t.float "value_kwh"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meter_id"], name: "index_measurements_on_meter_id"
  end

  create_table "meters", force: :cascade do |t|
    t.string "type"
    t.integer "unit_id", null: false
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_meters_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "house_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_units_on_house_id"
  end

  add_foreign_key "measurements", "meters"
  add_foreign_key "meters", "units"
  add_foreign_key "units", "houses"
end
