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

ActiveRecord::Schema.define(version: 2021_11_29_213523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "real_estate_properties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "guests", default: 1, null: false
    t.integer "bed_room", default: 0, null: false
    t.integer "bed", default: 0, null: false
    t.integer "bath", default: 0, null: false
    t.boolean "kitchen", default: false
    t.boolean "wifi", default: false
    t.boolean "parking", default: false
    t.boolean "backyard", default: false
    t.boolean "pets_allowed", default: false
    t.string "description", null: false
    t.uuid "real_estate_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["real_estate_id"], name: "index_real_estate_properties_on_real_estate_id"
  end

  create_table "real_estates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "price", precision: 8, scale: 2, null: false
    t.string "country", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "building", null: false
    t.string "zip", null: false
    t.float "rating", default: 0.0, null: false
    t.datetime "check_in", null: false
    t.datetime "check_out", null: false
    t.integer "property_type", default: 0, null: false
    t.integer "property_status", default: 0, null: false
    t.string "rentable_type"
    t.uuid "rentable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rentable_type", "rentable_id"], name: "index_real_estates_on_rentable"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
