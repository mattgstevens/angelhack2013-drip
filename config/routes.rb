Angelhack2013Drip::Application.routes.draw do
  root :to => 'home#index'

  # auths
  match '/auth/twitter/callback' => 'sessions_twitter#create'
  match '/signout_twitter' => 'sessions_twitter#destroy'
  match '/signin_twitter' => 'sessions_twitter#new'
  match '/auth/facebook/callback' => 'sessions_facebook#create'
  match '/signout_facebook' => 'sessions_facebook#destroy'
  match '/signin_facebook' => 'sessions_facebook#new'

  resources :users
  get '/info', to: 'users#info', as: 'user_info'
  get '/donate', to: 'users#donate', as: 'donate'

  # stats
  get '/leaderboard', to: 'clinic#info', as: 'leaderboard'
  get '/map', to: 'clinic#map', as: 'map'
end
