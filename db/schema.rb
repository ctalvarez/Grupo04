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

ActiveRecord::Schema.define(version: 20170624054934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actor_series", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "serie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actor_id"], name: "index_actor_series_on_actor_id", using: :btree
    t.index ["serie_id"], name: "index_actor_series_on_serie_id", using: :btree
  end

  create_table "actors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "session_id"
    t.integer  "duration"
    t.index ["session_id"], name: "index_chapters_on_session_id", using: :btree
  end

  create_table "child_filters", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_child_filters_on_genre_id", using: :btree
    t.index ["user_id"], name: "index_child_filters_on_user_id", using: :btree
  end

  create_table "director_series", force: :cascade do |t|
    t.integer  "director_id"
    t.integer  "serie_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["director_id"], name: "index_director_series_on_director_id", using: :btree
    t.index ["serie_id"], name: "index_director_series_on_serie_id", using: :btree
  end

  create_table "directors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "news", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "serie_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["serie_id"], name: "index_news_on_serie_id", using: :btree
    t.index ["user_id"], name: "index_news_on_user_id", using: :btree
  end

  create_table "parent_children", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "child_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_parent_children_on_child_id", using: :btree
    t.index ["parent_id"], name: "index_parent_children_on_parent_id", using: :btree
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

  create_table "seens", force: :cascade do |t|
    t.integer  "chapter_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_seens_on_chapter_id", using: :btree
    t.index ["user_id"], name: "index_seens_on_user_id", using: :btree
  end

  create_table "series", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "language"
    t.boolean  "private"
    t.string   "image"
    t.string   "country"
    t.integer  "session_amount"
    t.date     "year_release"
    t.index ["user_id"], name: "index_series_on_user_id", using: :btree
  end

  create_table "sessions", force: :cascade do |t|
    t.date     "date_release"
    t.integer  "status"
    t.integer  "session_number"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "serie_id"
    t.index ["serie_id"], name: "index_sessions_on_serie_id", using: :btree
  end

  create_table "subtitle_integrations", force: :cascade do |t|
    t.integer  "subtitle_id"
    t.integer  "serie_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["serie_id"], name: "index_subtitle_integrations_on_serie_id", using: :btree
    t.index ["subtitle_id"], name: "index_subtitle_integrations_on_subtitle_id", using: :btree
  end

  create_table "subtitles", force: :cascade do |t|
    t.string   "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "actor_series", "actors"
  add_foreign_key "actor_series", "series", column: "serie_id"
  add_foreign_key "chapters", "sessions"
  add_foreign_key "child_filters", "genres"
  add_foreign_key "director_series", "directors"
  add_foreign_key "director_series", "series", column: "serie_id"
  add_foreign_key "genre_series", "genres"
  add_foreign_key "genre_series", "series", column: "serie_id"
  add_foreign_key "news", "series", column: "serie_id"
  add_foreign_key "news", "users"
  add_foreign_key "scores", "chapters"
  add_foreign_key "scores", "users"
  add_foreign_key "seens", "chapters"
  add_foreign_key "seens", "users"
  add_foreign_key "series", "users"
  add_foreign_key "sessions", "series", column: "serie_id"
  add_foreign_key "subtitle_integrations", "series", column: "serie_id"
  add_foreign_key "subtitle_integrations", "subtitles"
end
