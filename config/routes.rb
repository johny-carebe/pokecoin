# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :adquired_pokemons, only: [:index]
  resources :profile,           only: [:index]

  get  '/pokemon_not_found', to: 'home#pokemon_not_found'
  get  '/pokemons',          to: 'pokemons#show'
  post '/pokemons',          to: 'pokemons#create'
  get  '/transactions',      to: 'transactions#show'
  post '/pokemons/:id/sell', to: 'transactions#transaction_sell_pokemon', as: 'transaction_sell_pokemon'
end
