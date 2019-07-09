Footy::Application.routes.draw do
  root :to => 'sessions#index'

  resources :weeks,        :only => [:index]
  resources :sessions,     :only => [:new, :create]
  resources :bets,         :only => [:create, :update, :index, :show]
  resources :fa_bets,      :only => [:index, :create, :new, :edit, :update]
  resources :lm_rounds,    :only => [:index]
  resources :lm_bets,      :only => [:create, :update]
  resources :lm_points,    :only => [:index]
  resources :gb_bets,      :only => [:index, :create, :new]
  resources :gb_points,    :only => [:index, :show]
  resources :sweep_bets,   :only => [:index, :create, :new]
  resources :sweep_points, :only => [:index]
  resources :winners,      :only => [:index, :show]
  resources :jobs,         :only => [:index]
  resources :fat_selections,   :only => [:index, :create, :new, :edit, :update, :show]
  resources :fat_rounds,       :only => [:index]
  resources :group_standings,  :only => [:index]
  resources :league_standings, :only => [:index]
  resources :lp_rounds,    :only => [:index]
  resources :lp_bets,      :only => [:create, :update]
  resources :lp_points,    :only => [:index]
  # resources :fat_points,       :only => [:index]

  get  'sessions'                                 => 'sessions#new'
  get  'weeks/:week_id/fixtures'                  => 'fixtures#index',  :as => 'fixtures'
  put  'weeks/:week_id/fixtures'                  => 'fixtures#index'
  post 'weeks/:week_id/fixtures/:fixture_id/bets' => 'bets#new',        :as => 'new_fixture_bet'
  get  'weeks/:week_id/fixtures/:fixture_id/bets' => 'bets#edit',       :as => 'edit_fixture_bet'
  get  'weeks/:week_id/fixtures/:fixture_id/bets_info' => 'fixtures#bets_info',  :as => 'fixture_bets_info'
  get  'weeks/:week_id/points'                    => 'points#show',     :as => 'week_points'
  get  'points'                                   => 'points#index',    :as => 'points'
  get  'info'                                     => 'info#index',      :as => 'info'
  get  'fa_points'                                => 'fa_points#index', :as => 'fa_points'
  post 'lm_rounds/:lm_round_id/lm_bets'           => 'lm_bets#new',     :as => 'new_lm_bet'
  get  'lm_rounds/:lm_round_id/lm_bets'           => 'lm_bets#edit',    :as => 'edit_lm_bet'
  get  'lm_rounds_info'                           => 'lm_rounds#info',  :as => 'lm_rounds_info'
  post 'lp_rounds/:lp_round_id/lp_bets'           => 'lp_bets#new',     :as => 'new_lp_bet'
  get  'lp_rounds/:lp_round_id/lp_bets'           => 'lp_bets#edit',    :as => 'edit_lp_bet'
  put  'lp_rounds'                                => 'lp_rounds#index'
  get  'lp_rounds_info'                           => 'lp_rounds#info',  :as => 'lp_rounds_info'
  get  'users/:user_id/weeks/:week_id/fixtures'   => 'users#index',     :as => 'user_week_fixtures'
  get  'users/:user_id/lm_rounds'                 => 'users#show',      :as => 'user_lm_rounds'
  get  'weeks/:week_id/fixtures/:fixture_id/events' => 'events#index',  :as => 'fixture_events'
  get  'gb_points_info'                           => 'gb_points#info',  :as => 'gb_points_info'
  match 'jobs/perform/:job_name'                  => 'jobs#perform',    :as => 'jobs_perform', :via => :post
  #match '*a', :to => 'errors#routing'
  get  'fat_rounds/:fat_round_id/fat_bets'        => 'fat_bets#index',  :as => 'fat_bets'
  get  'fat_rounds/:fat_round_id/points'          => 'fat_points#show',:as => 'fat_points'
  get  'fat_points'                               => 'fat_points#index', :as => 'fat_total_points'
  get  'users/:user_id/fat_round/:fat_round_id/bets'   => 'users#fat_round_bets',     :as => 'user_fat_round_bets'
  get  'teams/players'   => 'teams#players',     :as => 'team_players'
  get  'weeks/:week_id/fixtures/:fixture_id/goals' => 'goals#index', :as => 'goals'
  put  'weeks/:week_id/fixtures/:fixture_id/goals' => 'goals#update', :as => 'update_goals'
  get  'goals'                                   => 'goals#all',  :as => 'goals_all'

  namespace :api do
    post 'fixtures/add_score'  => 'fixtures#add_score'
    post 'fixtures/add_goal'  => 'fixtures#add_goal'
  end

end
