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

ActiveRecord::Schema.define(version: 20170429204055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chapters", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "serie_id"
    t.index ["serie_id"], name: "index_chapters_on_serie_id", using: :btree
  end

  create_table "genre_series", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "genre_id"
    t.integer  "serie_id"
    t.index ["genre_id"], name: "index_genre_series_on_genre_id", using: :btree
    t.index ["serie_id"], name: "index_genre_series_on_serie_id", using: :btree
  end

  create_table "genres", force: :cascade do |t|
    t.string   "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", force: :cascade do |t|
    t.text     "comment"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "chapter_id"
    t.index ["chapter_id"], name: "index_scores_on_chapter_id", using: :btree
    t.index ["user_id"], name: "index_scores_on_user_id", using: :btree
  end

  create_table "series", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "idiom"
    t.boolean  "private"
    t.string   "image"
    t.index ["user_id"], name: "index_series_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.integer  "rol"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "image"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "chapters", "series", column: "serie_id"
  add_foreign_key "genre_series", "genres"
  add_foreign_key "genre_series", "series", column: "serie_id"
  add_foreign_key "scores", "chapters"
  add_foreign_key "scores", "users"
  add_foreign_key "series", "users"
end