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

ActiveRecord::Schema.define(version: 20190829125150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bet_singles", force: :cascade do |t|
    t.string "type", null: false
    t.integer "round_id", null: false
    t.integer "user_id", null: false
    t.integer "selection", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "result", default: "pending", null: false
  end

  create_table "bets", id: :serial, force: :cascade do |t|
    t.integer "fixture_id", null: false
    t.integer "user_id", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bonuses", id: :serial, force: :cascade do |t|
    t.integer "point_id"
    t.integer "fixture_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communications", id: :serial, force: :cascade do |t|
    t.string "type", null: false
    t.string "status", null: false
    t.integer "user_id", null: false
    t.string "message", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", id: :serial, force: :cascade do |t|
    t.string "event_type"
    t.string "team"
    t.string "player_name"
    t.integer "minute"
    t.integer "fixture_id"
    t.integer "external_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.integer "player_id"
  end

  create_table "fa_bets", id: :serial, force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fa_points", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fat_bets", force: :cascade do |t|
    t.integer "fat_round_id", null: false
    t.integer "user_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fat_points", force: :cascade do |t|
    t.integer "fat_round_id", null: false
    t.integer "user_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "additional_info"
  end

  create_table "fat_rounds", force: :cascade do |t|
    t.integer "week_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fat_selections", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fixtures", id: :serial, force: :cascade do |t|
    t.integer "week_id"
    t.datetime "kickoff"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "external_id"
    t.string "status", default: "defined"
  end

  create_table "games", id: :serial, force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games_users", id: false, force: :cascade do |t|
    t.integer "game_id"
    t.integer "user_id"
    t.index ["game_id"], name: "index_games_users_on_game_id"
    t.index ["user_id"], name: "index_games_users_on_user_id"
  end

  create_table "gb_bets", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gb_points", id: :serial, force: :cascade do |t|
    t.integer "team_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "minute"
  end

  create_table "gb_rounds", id: :serial, force: :cascade do |t|
    t.integer "starting_week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", id: :serial, force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "score_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_teams", force: :cascade do |t|
    t.integer "group_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lm_bets", force: :cascade do |t|
    t.integer "lm_round_id", null: false
    t.integer "user_id", null: false
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lm_points", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lm_rounds", force: :cascade do |t|
    t.integer "week_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lp_bets", force: :cascade do |t|
    t.integer "lp_round_id", null: false
    t.integer "user_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lp_points", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "value", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lp_rounds", force: :cascade do |t|
    t.integer "week_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", id: :serial, force: :cascade do |t|
    t.integer "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "surname"
    t.string "forename"
    t.integer "squad_number"
    t.string "reference"
    t.string "position"
    t.integer "external_id"
    t.boolean "active", default: true
  end

  create_table "points", id: :serial, force: :cascade do |t|
    t.integer "week_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "value"
    t.integer "bonus", default: 0
  end

  create_table "positions", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "previous"
    t.integer "current"
    t.integer "last_marked_week_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scores", id: :serial, force: :cascade do |t|
    t.integer "fixture_id", null: false
    t.integer "home", null: false
    t.integer "away", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "standings", id: :serial, force: :cascade do |t|
    t.integer "position"
    t.integer "team_id"
    t.string "form"
    t.integer "form_score"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "played"
    t.integer "goal_difference"
    t.string "type"
    t.integer "goals_for"
    t.integer "goals_against"
    t.string "group_id"
  end

  create_table "sweep_bets", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sweep_points", id: :serial, force: :cascade do |t|
    t.integer "team_id"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "abbreviation"
    t.integer "external_id"
    t.string "short_name"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", null: false
    t.string "password", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "mobile"
    t.integer "community_id", default: 1
  end

  create_table "weeks", id: :serial, force: :cascade do |t|
    t.datetime "close_date", null: false
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "complete"
  end

end
