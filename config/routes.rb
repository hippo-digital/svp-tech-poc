# frozen_string_literal: true

Rails.application.routes.draw do
  get 'address' => 'address#show'
  post 'address' => 'address#submit'

  get 'help_with_food_delivery' => 'help_with_food_delivery#show'
  post 'help_with_food_delivery' => 'help_with_food_delivery#submit'

  root 'home#index'

  get 'user-details' => 'home#user_details'
  get 'check_your_answers' => 'check_your_answers#show'
  get '/logout' => 'oidc#logout'

  get 'auth/oidc', as: 'authentication'
  get 'auth/oidc/callback' => 'oidc#callback'
  get 'auth/failure' => 'oidc#failure'
end
