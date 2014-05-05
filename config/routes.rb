Footy::Application.routes.draw do
  root :to => "sessions#index"

  resources :weeks,    :only => [:index]
  resources :sessions, :only => [:new, :create]
  resources :bets,     :only => [:create]

  get  'sessions' => 'sessions#new'
  get  'weeks/:week_id/fixtures' => 'fixtures#index', :as => 'fixtures'
  post 'weeks/:week_id/fixtures/:fixture_id/bets' => 'bets#new', :as => 'new_fixture_bet'
  get  'weeks/:week_id/fixtures/:fixture_id/bets' => 'bets#edit', :as => 'edit_fixture_bet'
  put  'weeks/:week_id/fixtures/:fixture_id/bets' => 'bets#update', :as => 'update_fixture_bet'
  get  'weeks/:week_id/fixtures/:fixture_id/bet/:id' => 'bets#show', :as => 'fixture_bet'
  get  'weeks/:week_id/points' => 'points#show', :as => 'week_points'
  get  'points' => 'points#index', :as => 'points'
  get  'info' => 'info#index', :as => 'info'
  get 'weeks/:week_id/user/:id' => 'users#show', :as => 'week_users'

end