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

ActiveRecord::Schema.define(version: 2019_05_20_200950) do

  create_table "cards", force: :cascade do |t|
    t.string "card_id"
    t.integer "amber"
    t.integer "armor"
    t.integer "card_number"
    t.string "card_text"
    t.string "card_title"
    t.string "card_type"
    t.integer "expansion"
    t.string "flavor_text"
    t.string "front_image"
    t.string "house"
    t.boolean "is_maverick"
    t.integer "power"
    t.string "rarity"
    t.string "traits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_cards_on_card_id", unique: true
  end

end
