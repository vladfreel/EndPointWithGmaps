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

ActiveRecord::Schema.define(version: 20180315095247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "excavators", force: :cascade do |t|
    t.string "company_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "type"
    t.integer "ticket_id"
    t.boolean "crew_on_site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "request_number"
    t.integer "sequence_number"
    t.string "request_type"
    t.string "primary_service_area_code"
    t.string "additional_service_area_codes"
    t.text "dig_site_info"
    t.datetime "response_due_date_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
