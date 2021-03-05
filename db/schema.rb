# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_05_163757) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deputies", force: :cascade do |t|
    t.string "name"
    t.integer "deputy_id"
    t.string "card_number"
    t.string "federal_id"
    t.string "state", limit: 2
    t.string "political_party", limit: 255
    t.bigint "legislature_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["legislature_id"], name: "index_deputies_on_legislature_id"
  end

  create_table "expense_type_specifications", force: :cascade do |t|
    t.text "description"
    t.bigint "expense_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expense_type_id"], name: "index_expense_type_specifications_on_expense_type_id"
  end

  create_table "expense_types", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "expenses", force: :cascade do |t|
    t.integer "document_number"
    t.string "provider"
    t.string "federal_id"
    t.integer "kind"
    t.datetime "issue_date"
    t.decimal "document_value", precision: 9, scale: 2
    t.decimal "gloss_value", precision: 9, scale: 2
    t.decimal "net_value", precision: 9, scale: 2
    t.integer "month"
    t.integer "year"
    t.integer "portion"
    t.string "passenger"
    t.string "part"
    t.string "batch"
    t.string "refund"
    t.string "restitution"
    t.string "document_url"
    t.bigint "expense_type_id", null: false
    t.bigint "deputy_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deputy_id"], name: "index_expenses_on_deputy_id"
    t.index ["expense_type_id"], name: "index_expenses_on_expense_type_id"
  end

  create_table "legislatures", force: :cascade do |t|
    t.integer "year"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "deputies", "legislatures"
  add_foreign_key "expense_type_specifications", "expense_types"
  add_foreign_key "expenses", "deputies"
  add_foreign_key "expenses", "expense_types"
end
