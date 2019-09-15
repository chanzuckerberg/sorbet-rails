# typed: strict
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

ActiveRecord::Schema.define(version: 2019_06_20_000007) do

  create_table "spell_books", force: :cascade do |t|
    t.string "name"
    t.integer "wizard_id"
    t.integer "book_type", default: 0, null: false
    t.index ["wizard_id"], name: "index_spell_books_on_wizard_id"
  end

  create_table "wands", force: :cascade do |t|
    t.integer "wizard_id", null: false
    t.string "wood_type"
    t.integer "core_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "flexibility", default: 0.5, null: false
    t.decimal "hardness", precision: 10, scale: 10, default: "5.0", null: false
    t.decimal "reflectance", precision: 10, default: "0", null: false
    t.boolean "broken", default: false, null: false
    t.date "chosen_at_date"
    t.time "chosen_at_time"
    t.json "spell_history"
    t.json "maker_info", default: "{}", null: false
    t.index ["wizard_id"], name: "index_wands_on_wizard_id"
  end

  create_table "wizards", force: :cascade do |t|
    t.string "name"
    t.integer "house"
    t.string "parent_email"
    t.text "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "broom"
    t.integer "quidditch_position"
    t.integer "hair_color"
    t.integer "eye_color"
    t.integer "hair_length"
    t.string "type", default: "Wizard", null: false
  end

end
