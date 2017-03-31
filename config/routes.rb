Footy::Application.routes.draw do
  root :to => 'sessions#index'

  resources :weeks,        :only => [:index]
  resources :sessions,     :only => [:new, :create]
  resources :hda_bets,     :only => [:create, :update, :index, :show]
  resources :goals,        :only => [:index]
  resources :fa_bets,      :only => [:index, :create, :new, :edit, :update]
  resources :lms_rounds,   :only => [:index]
  resources :lms_bets,     :only => [:create, :update]
  resources :lms_points,   :only => [:index]
  resources :standings,    :only => [:index]
  resources :gb_bets,      :only => [:index, :create, :new]
  resources :gb_points,    :only => [:index, :show]
  resources :sweep_bets,   :only => [:index, :create, :new]
  resources :sweep_points, :only => [:index]
  resources :winners,      :only => [:index, :show]
  resources :jobs,         :only => [:index]

  get  'sessions'                                           => 'sessions#new'
  get  'weeks/:week_id/fixtures'                            => 'fixtures#index',          :as => 'fixtures'
  put  'weeks/:week_id/fixtures'                            => 'fixtures#index',          :as => 'fixtures'
  post 'weeks/:week_id/fixtures/:fixture_id/hda_bets'       => 'hda_bets#new',            :as => 'new_fixture_hda_bet'
  get  'weeks/:week_id/fixtures/:fixture_id/hda_bets'       => 'hda_bets#edit',           :as => 'edit_fixture_hda_bet'
  get  'weeks/:week_id/fixtures/:fixture_id/hda_bets_info'  => 'fixtures#hda_bets_info',  :as => 'fixture_hda_bets_info'
  get  'weeks/:week_id/points'                              => 'points#show',             :as => 'week_points'
  get  'points'                                             => 'points#index',            :as => 'points'
  get  'info'                                               => 'info#index',              :as => 'info'
  get  'fa_points'                                          => 'fa_points#index',         :as => 'fa_points'
  post 'lms_rounds/:lms_round_id/lms_bets'                  => 'lms_bets#new',            :as => 'new_lm_bet'
  get  'lms_rounds/:lms_round_id/lms_bets'                  => 'lms_bets#edit',           :as => 'edit_lm_bet'
  get  'lms_rounds_info'                                    => 'lms_rounds#info',         :as => 'lms_rounds_info'
  get  'users/:user_id/weeks/:week_id/fixtures'             => 'users#index',             :as => 'user_week_fixtures'
  get  'users/:user_id/lms_rounds'                          => 'users#show',              :as => 'user_lms_rounds'
  get  'weeks/:week_id/fixtures/:fixture_id/events'         => 'events#index',            :as => 'fixture_events'
  get  'gb_points_info'                                     => 'gb_points#info',          :as => 'gb_points_info'
  match 'jobs/perform/:job_name'                            => 'jobs#perform',            :as => 'jobs_perform', :via => :post
  #match '*a', :to => 'errors#routing'

  namespace :api do
    post 'fixtures/add_score'  => 'fixtures#add_score'
  end

end
