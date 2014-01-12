Footy::Application.routes.draw do
  root :to => "sessions#index"

  resources :weeks,    :only => [:index, :show]
  resources :fixtures, :only => [:index]
  resources :sessions, :only => [:new, :create]
  resources :bets,     :only => [:new, :create]
  resources :points,   :only => [:index]

  get  'sessions' => 'sessions#new'
  post 'weeks/:fixture_id/bets' => 'bets#new', :as => 'new_fixture_bet'
  get  'weeks/:week_id/fixtures/:fixture_id/bet/:id' => 'bets#show', :as => 'fixture_bet'
  get  'weeks/:week_id/points' => 'points#index', :as => 'week_points'

end