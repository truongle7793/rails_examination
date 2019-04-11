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

ActiveRecord::Schema.define(version: 2019_04_04_094831) do

  create_table "activities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities_guides", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "guide_id", null: false
    t.bigint "activity_id", null: false
    t.index ["activity_id", "guide_id"], name: "index_activities_guides_on_activity_id_and_guide_id"
    t.index ["activity_id"], name: "index_activities_guides_on_activity_id"
    t.index ["guide_id", "activity_id"], name: "index_activities_guides_on_guide_id_and_activity_id"
    t.index ["guide_id"], name: "index_activities_guides_on_guide_id"
  end

  create_table "guides", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guides_languages", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "guide_id", null: false
    t.bigint "language_id", null: false
    t.index ["guide_id", "language_id"], name: "index_guides_languages_on_guide_id_and_language_id"
    t.index ["guide_id"], name: "index_guides_languages_on_guide_id"
    t.index ["language_id", "guide_id"], name: "index_guides_languages_on_language_id_and_guide_id"
    t.index ["language_id"], name: "index_guides_languages_on_language_id"
  end

  create_table "languages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "guide_id"
    t.integer "score", limit: 1, null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guide_id"], name: "index_reviews_on_guide_id"
  end

  add_foreign_key "activities_guides", "activities"
  add_foreign_key "activities_guides", "guides"
  add_foreign_key "guides_languages", "guides"
  add_foreign_key "guides_languages", "languages"
  add_foreign_key "reviews", "guides"
end
