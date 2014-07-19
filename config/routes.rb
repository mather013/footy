Footy::Application.routes.draw do
  root :to => "sessions#index"

  resources :weeks,    :only => [:index]
  resources :sessions, :only => [:new, :create]
  resources :bets,     :only => [:create, :update]
  resources :goals,    :only => [:index]
  resources :fa_bets,  :only => [:index]
  resources :lm_rounds,:only => [:index]
  resources :lm_bets,  :only => [:create,:update]

  get  'sessions' => 'sessions#new'
  get  'weeks/:week_id/fixtures' => 'fixtures#index', :as => 'fixtures'
  put  'weeks/:week_id/fixtures' => 'fixtures#index', :as => 'fixtures'
  post 'weeks/:week_id/fixtures/:fixture_id/bets' => 'bets#new', :as => 'new_fixture_bet'
  get  'weeks/:week_id/fixtures/:fixture_id/bets' => 'bets#edit', :as => 'edit_fixture_bet'
  get  'weeks/:week_id/points' => 'points#show', :as => 'week_points'
  get  'points' => 'points#index', :as => 'points'
  get  'info' => 'info#index', :as => 'info'
  get  'weeks/:week_id/user/:id' => 'users#show', :as => 'week_users'
  get  'fa_points' => 'fa_points#index', :as => 'fa_points'
  post 'lm_rounds/:lm_round_id/lm_bets' => 'lm_bets#new', :as => 'new_lm_bet'
  get  'lm_rounds/:lm_round_id/lm_bets' => 'lm_bets#edit', :as => 'edit_lm_bet'
  get  'lm_points' => 'lm_points#index', :as => 'lm_points'
  #put  'lm_rounds/:lm_round_id/lm_bets' => 'lm_bets#update', :as => 'update_lm_bet'
end
