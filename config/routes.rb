Rails.application.routes.draw do
  root 'home#index'

  get 'user-details' => 'home#user_details'
  get '/logout' => 'oidc#logout'

  get 'auth/oidc', as: 'authentication'
  get 'auth/oidc/callback' => 'oidc#callback'
  get 'auth/failure' => 'oidc#failure'
end
