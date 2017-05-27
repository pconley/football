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

ActiveRecord::Schema.define(version: 20170527174235) do

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors_movies", force: :cascade do |t|
    t.integer "actor_id"
    t.integer "movie_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "cc"
    t.string "cn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer "player_id"
    t.integer "team_id"
    t.string "position"
    t.boolean "isCaptain"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "birth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players_teams", force: :cascade do |t|
    t.integer "player_id"
    t.integer "team_id"
    t.string "position"
  end

  create_table "teams", force: :cascade do |t|
    t.string "year"
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
