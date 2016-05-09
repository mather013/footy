Footy::Application.routes.draw do
  root :to => 'sessions#index'

  resources :weeks,        :only => [:index]
  resources :sessions,     :only => [:new, :create]
  resources :bets,         :only => [:create, :update]
  resources :goals,        :only => [:index]
  resources :fa_bets,      :only => [:index, :create, :new, :edit, :update]
  resources :lm_rounds,    :only => [:index]
  resources :lm_bets,      :only => [:create, :update]
  resources :standings,    :only => [:index]
  resources :gb_bets,      :only => [:index, :create, :new]
  resources :gb_points,    :only => [:index, :show]
  resources :sweep_bets,   :only => [:index, :create, :new]
  resources :sweep_points, :only => [:index]

  get  'sessions'                                 => 'sessions#new'
  get  'weeks/:week_id/fixtures'                  => 'fixtures#index',  :as => 'fixtures'
  put  'weeks/:week_id/fixtures'                  => 'fixtures#index',  :as => 'fixtures'
  post 'weeks/:week_id/fixtures/:fixture_id/bets' => 'bets#new',        :as => 'new_fixture_bet'
  get  'weeks/:week_id/fixtures/:fixture_id/bets' => 'bets#edit',       :as => 'edit_fixture_bet'
  get  'weeks/:week_id/points'                    => 'points#show',     :as => 'week_points'
  get  'points'                                   => 'points#index',    :as => 'points'
  get  'info'                                     => 'info#index',      :as => 'info'
  get  'fa_points'                                => 'fa_points#index', :as => 'fa_points'
  post 'lm_rounds/:lm_round_id/lm_bets'           => 'lm_bets#new',     :as => 'new_lm_bet'
  get  'lm_rounds/:lm_round_id/lm_bets'           => 'lm_bets#edit',    :as => 'edit_lm_bet'
  get  'lm_points'                                => 'lm_points#index', :as => 'lm_points'
  get  'lm_rounds_info'                           => 'lm_rounds#info',  :as => 'lm_rounds_info'
  get  'users/:user_id/weeks/:week_id/fixtures'   => 'users#index',     :as => 'user_week_fixtures'
  get  'users/:user_id/lm_rounds'                 => 'users#show',      :as => 'user_lm_rounds'
  get  'weeks/:week_id/fixtures/:fixture_id/events' => 'events#index',  :as => 'fixture_events'
  get  'gb_points_info'                           => 'gb_points#info',  :as => 'gb_points_info'
  match '*a', :to => 'errors#routing'
end
