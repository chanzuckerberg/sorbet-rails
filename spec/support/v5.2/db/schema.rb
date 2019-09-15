# typed: strong
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "broom"
    t.integer "quidditch_position"
    t.integer "hair_color"
    t.integer "eye_color"
    t.integer "hair_length"
    t.string "type", default: "Wizard", null: false
  end

end
