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

ActiveRecord::Schema.define(version: 20171204104811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "metadata", force: :cascade do |t|
    t.string "category", null: false
    t.string "resource", null: false
    t.string "version"
    t.string "contact_organisation", null: false
    t.string "dataset_id", null: false
    t.string "metadata", null: false
    t.string "factsheet"
    t.boolean "marine_spatial_planning", null: false
    t.boolean "education", null: false
    t.boolean "environmental_impact_assessment", null: false
    t.boolean "ecosystem_assessment", null: false
    t.boolean "ecosystem_services", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
