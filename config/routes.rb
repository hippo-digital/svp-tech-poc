# frozen_string_literal: true

Rails.application.routes.draw do
  get 'address' => 'address#show'
  post 'address' => 'address#submit'

  get 'help-with-food-delivery' => 'help_with_food_delivery#show'
  post 'help-with-food-delivery' => 'help_with_food_delivery#submit'

  root 'home#index'

  get 'user-details' => 'home#user_details'
  get 'check-your-answers' => 'check_your_answers#show'
  post 'check-your-answers' => 'check_your_answers#submit'
  get '/logout' => 'oidc#logout'

  get 'auth/oidc', as: 'authentication'
  get 'auth/oidc/callback' => 'oidc#callback'
  get 'auth/failure' => 'oidc#failure'
end
