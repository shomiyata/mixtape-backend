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

ActiveRecord::Schema.define(version: 20170928004406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "available_markets", force: :cascade do |t|
    t.integer "track_id"
    t.string "region"
  end

  create_table "mixtapes", force: :cascade do |t|
    t.string "name"
    t.string "spotify_playlist_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "recipient_email"
    t.text "note"
    t.boolean "email_required"
    t.string "sender_name"
    t.string "playlist_name"
    t.integer "url"
    t.string "sender_spotify_username"
    t.string "owner_username"
    t.string "playlist_picture"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "track_uri"
    t.integer "mixtape_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "spotify_user_id"
    t.string "access_token"
    t.string "refresh_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
