# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140517094748) do

  create_table "administrators", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applications", force: true do |t|
    t.integer  "language"
    t.integer  "text_size"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chronologies", force: true do |t|
    t.boolean  "auto_mode"
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chronologies", ["application_id"], name: "index_chronologies_on_application_id", using: :btree

  create_table "event_translations", force: true do |t|
    t.string   "lang"
    t.string   "title"
    t.string   "content"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "event_translations", ["event_id"], name: "index_event_translations_on_event_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "date"
    t.boolean  "published"
    t.boolean  "public"
    t.integer  "chronology_id"
    t.integer  "map_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["chronology_id"], name: "index_events_on_chronology_id", using: :btree
  add_index "events", ["map_id"], name: "index_events_on_map_id", using: :btree

  create_table "images", force: true do |t|
    t.string   "name"
    t.string   "path"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hashcode"
    t.string   "caption"
  end

  add_index "images", ["event_id"], name: "index_images_on_event_id", using: :btree

  create_table "languages", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "maps", force: true do |t|
    t.integer  "application_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "maps", ["application_id"], name: "index_maps_on_application_id", using: :btree

  create_table "puzzles", force: true do |t|
    t.string   "name"
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "puzzles", ["image_id"], name: "index_puzzles_on_image_id", using: :btree

end
