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

ActiveRecord::Schema[7.2].define(version: 2026_11_09_000200) do
  create_table "families", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_families_on_name", unique: true
  end

  create_table "garden_uses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_garden_uses_on_name", unique: true
  end

  create_table "habitats", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_habitats_on_name", unique: true
  end

  create_table "plant_garden_uses", force: :cascade do |t|
    t.integer "plant_id", null: false
    t.integer "garden_use_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["garden_use_id"], name: "index_plant_garden_uses_on_garden_use_id"
    t.index ["plant_id", "garden_use_id"], name: "index_plant_garden_uses_on_plant_id_and_garden_use_id", unique: true
    t.index ["plant_id"], name: "index_plant_garden_uses_on_plant_id"
  end

  create_table "plant_habitats", force: :cascade do |t|
    t.integer "plant_id", null: false
    t.integer "habitat_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["habitat_id"], name: "index_plant_habitats_on_habitat_id"
    t.index ["plant_id", "habitat_id"], name: "index_plant_habitats_on_plant_id_and_habitat_id", unique: true
    t.index ["plant_id"], name: "index_plant_habitats_on_plant_id"
  end

  create_table "plants", force: :cascade do |t|
    t.string "catalog_code", null: false
    t.string "name", null: false
    t.string "family_notes", null: false
    t.string "light", null: false
    t.integer "family_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["catalog_code"], name: "index_plants_on_catalog_code", unique: true
    t.index ["family_id"], name: "index_plants_on_family_id"
  end

  add_foreign_key "plant_garden_uses", "garden_uses"
  add_foreign_key "plant_garden_uses", "plants"
  add_foreign_key "plant_habitats", "habitats"
  add_foreign_key "plant_habitats", "plants"
  add_foreign_key "plants", "families"
end
