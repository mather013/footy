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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20160310164646) do

  create_table "bets", :force => true do |t|
    t.integer  "fixture_id", :null => false
    t.integer  "user_id",    :null => false
    t.string   "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "communications", :force => true do |t|
    t.string   "type",       :null => false
    t.string   "status",     :null => false
    t.integer  "user_id",    :null => false
    t.string   "message",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "events", :force => true do |t|
    t.string   "event_type"
    t.string   "team"
    t.string   "player_name"
    t.integer  "minute"
    t.integer  "fixture_id"
    t.integer  "external_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "team_id"
  end

  create_table "fa_bets", :force => true do |t|
    t.integer  "player_id",  :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fa_points", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "fixtures", :force => true do |t|
    t.integer  "week_id"
    t.datetime "kickoff"
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "name"
    t.integer  "external_id"
    t.string   "status",       :default => "defined"
  end

  create_table "games", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "games_users", :id => false, :force => true do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "gb_bets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gb_points", :force => true do |t|
    t.integer  "team_id"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "minute"
  end

  create_table "gb_rounds", :force => true do |t|
    t.integer  "starting_week_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "goals", :force => true do |t|
    t.integer  "player_id",  :null => false
    t.integer  "score_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lm_bets", :force => true do |t|
    t.integer  "lm_round_id", :null => false
    t.integer  "user_id",     :null => false
    t.integer  "team_id",     :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lm_points", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "lm_rounds", :force => true do |t|
    t.integer  "week_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.integer  "team_id",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "surname"
    t.string   "forename"
    t.integer  "squad_number"
  end

  create_table "points", :force => true do |t|
    t.integer  "week_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "value"
  end

  create_table "positions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "previous"
    t.integer  "current"
    t.integer  "last_marked_week_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "scores", :force => true do |t|
    t.integer  "fixture_id", :null => false
    t.integer  "home",       :null => false
    t.integer  "away",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "standings", :force => true do |t|
    t.integer  "position"
    t.integer  "team_id"
    t.string   "form"
    t.integer  "form_score"
    t.integer  "points"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "played"
    t.integer  "goal_difference"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "abbreviation"
    t.integer  "external_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username",   :null => false
    t.string   "password",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.string   "mobile"
  end

  create_table "weeks", :force => true do |t|
    t.datetime "close_date",  :null => false
    t.string   "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "complete"
  end

end
