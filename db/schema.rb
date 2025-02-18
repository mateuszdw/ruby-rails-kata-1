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

ActiveRecord::Schema.define(version: 2019_12_02_085123) do

  create_table "authors", force: :cascade do |t|
    t.string "email"
    t.string "firstname"
    t.string "lastname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_publications", id: false, force: :cascade do |t|
    t.integer "publication_id", null: false
    t.integer "author_id", null: false
    t.index ["publication_id", "author_id"], name: "index_authors_publications_on_publication_id_and_author_id"
  end

  create_table "publications", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "isbn"
    t.datetime "published_at"
    t.integer "publication_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["isbn"], name: "index_publications_on_isbn", unique: true
    t.index ["title"], name: "index_publications_on_title"
  end

end
