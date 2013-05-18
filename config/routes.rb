Angelhack2013Drip::Application.routes.draw do
  root :to => 'home#index'
  match '/auth/twitter/callback' => 'sessions_twitter#create'
  match '/signout_twitter' => 'sessions_twitter#destroy'
  match '/signin_twitter' => 'sessions_twitter#new'
  match '/auth/facebook/callback' => 'sessions_facebook#create'
  match '/signout_facebook' => 'sessions_facebook#destroy'
  match '/signin_facebook' => 'sessions_facebook#new'
end
