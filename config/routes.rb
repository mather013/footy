Footy::Application.routes.draw do
  root :to => "login#index"

  resources :competitions, :only => [:index]
  resources :login, :only => [:index, :new]

  get 'login' => 'login#index'
  post 'login/new' => 'login#new'#, :as => new_login_path
end
