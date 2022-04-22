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

ActiveRecord::Schema.define(version: 2022_04_21_233922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "competitions", force: :cascade do |t|
    t.string "kind"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "competitors", force: :cascade do |t|
    t.string "name"
    t.string "similar_names"
    t.bigint "ligue_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "code"
    t.string "country"
    t.index ["ligue_id"], name: "index_competitors_on_ligue_id"
  end

  create_table "highlights", force: :cascade do |t|
    t.bigint "competitor_1_id", null: false
    t.string "references"
    t.bigint "competitor_2_id", null: false
    t.bigint "source_id", null: false
    t.string "link"
    t.string "external_id"
    t.string "datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["competitor_1_id"], name: "index_highlights_on_competitor_1_id"
    t.index ["competitor_2_id"], name: "index_highlights_on_competitor_2_id"
    t.index ["source_id"], name: "index_highlights_on_source_id"
  end

  create_table "ligues", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string "kind"
    t.boolean "verified"
    t.string "parser_name"
    t.json "details"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "competition_id"
    t.index ["competition_id"], name: "index_sources_on_competition_id"
  end

  add_foreign_key "competitors", "ligues"
  add_foreign_key "highlights", "competitors", column: "competitor_1_id"
  add_foreign_key "highlights", "competitors", column: "competitor_2_id"
  add_foreign_key "highlights", "sources"
  add_foreign_key "sources", "competitions"
end
