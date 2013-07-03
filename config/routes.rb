Footy::Application.routes.draw do
  root :to => "sessions#index"

  resources :weeks,    :only => [:index, :show]
  resources :fixtures, :only => [:index]
  resources :sessions, :only => [:new, :create]

  get 'sessions' => 'sessions#new'
  #get 'competitions/:id' => 'competitions#show', :as => 'competition_fixtures'

end
