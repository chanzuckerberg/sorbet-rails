# typed: false
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

ActiveRecord::Schema[7.0].define(version: 2019_06_20_000015) do
  create_table "headmasters", force: :cascade do |t|
    t.integer "school_id"
    t.integer "wizard_id"
    t.index ["school_id"], name: "index_headmasters_on_school_id"
    t.index ["wizard_id"], name: "index_headmasters_on_wizard_id"
  end

  create_table "robes", force: :cascade do |t|
    t.integer "wizard_id"
    t.index ["wizard_id"], name: "index_robes_on_wizard_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
  end

  create_table "spell_books", force: :cascade do |t|
    t.string "name"
    t.integer "wizard_id", null: false
    t.integer "book_type", default: 0, null: false
    t.index ["wizard_id"], name: "index_spell_books_on_wizard_id"
  end

  create_table "spell_books_spells", id: false, force: :cascade do |t|
    t.integer "spell_id", null: false
    t.integer "spell_book_id", null: false
    t.index ["spell_id", "spell_book_id"], name: "index_spell_books_spells_on_spell_id_and_spell_book_id"
  end

  create_table "spells", force: :cascade do |t|
    t.string "name"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name"
  end

  create_table "subjects_wizards", id: false, force: :cascade do |t|
    t.integer "subject_id"
    t.integer "wizard_id"
    t.index ["subject_id", "wizard_id"], name: "index_subjects_wizards_on_subject_id_and_wizard_id"
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
    t.datetime "broken_at"
    t.date "chosen_at_date"
    t.time "chosen_at_time"
    t.json "spell_history"
    t.json "maker_info", default: "{}", null: false
    t.index ["wizard_id"], name: "index_wands_on_wizard_id"
  end

  create_table "wizards", force: :cascade do |t|
    t.string "name"
    t.integer "house"
    t.integer "professor"
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
    t.integer "school_id"
    t.text "owl_results"
    t.text "newt_subjects"
    t.text "pets"
    t.text "patronus_characteristics"
  end

  add_foreign_key "wizards", "schools"
end
