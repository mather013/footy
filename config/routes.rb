Footy::Application.routes.draw do
  root :to => "sessions#index"

  resources :weeks,    :only => [:index, :show]
  resources :fixtures, :only => [:index]
  resources :sessions, :only => [:new, :create]
  #resources :bets,     :only => [:new, :show]

  get 'sessions' => 'sessions#new'
  get 'weeks/:week_id/fixtures/:fixture_id/bet/new' => 'bets#new', :as => 'new_fixture_bet'
  post 'weeks/:fixture_id/bets' => 'bets#create', :as => 'fixture_bet'
  get 'weeks/:week_id/fixtures/:fixture_id/bet/:id' => 'bets#show', :as => 'fixture_bet'

end
