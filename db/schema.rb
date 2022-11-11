# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_221_102_001_807) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'assignments', primary_key: 'assignment_id', force: :cascade do |t|
    t.integer 'member_id'
    t.integer 'request_id'
    t.integer 'car_id'
    t.datetime 'drop_off_time'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'cars', primary_key: 'car_id', force: :cascade do |t|
    t.string 'make'
    t.string 'model'
    t.string 'color'
    t.string 'plate_number'
    t.date 'registration_expiry'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'drivers', primary_key: 'driver_id', force: :cascade do |t|
    t.integer 'member_id'
    t.integer 'car_id'
    t.datetime 'check_in_time'
    t.string 'driver_status'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table "requests", primary_key: "request_id", force: :cascade do |t|
    t.integer "rider_id"
    t.string "request_status"
    t.datetime "date_time"
    t.string "pick_up_loc"
    t.boolean "is_address_BCS"
    t.integer "num_passengers"
    t.string "additional_info"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table 'requests', primary_key: 'request_id', force: :cascade do |t|
    t.string 'name'
    t.string 'phone_number'
    t.string 'request_status'
    t.string 'pick_up_loc'
    t.string 'drop_off_loc'
    t.integer 'num_passengers'
    t.string 'additional_info'
    t.integer 'queue_pos'
    t.datetime 'time_cancelled'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

end
