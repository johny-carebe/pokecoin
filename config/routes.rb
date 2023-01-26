# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :pokemons,     only: %i[index create] do
    get 'not_found',       on: :collection
    post 'sell',           on: :member
  end

  resources :transactions, only: [:index]

  get '/profile', to: 'profile#show'
end
