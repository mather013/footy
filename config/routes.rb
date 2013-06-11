Footy::Application.routes.draw do
  root :to => "sessions#index"

  resources :competitions, :only => [:index]
  resources :sessions, :only => [:new, :create]

  get 'sessions' => 'sessions#new'

end
