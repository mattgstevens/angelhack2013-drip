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
  get '/leaderboard', to: 'leaderboard#info', as: 'leaderboard'
  get '/city_stats', to: 'leaderboard#city_stats'
  get '/clinic_stats', to: 'leaderboard#clinic_stats'
end
