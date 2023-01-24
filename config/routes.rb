# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :adquired_pokemons, only: [:index]
  resources :profile,           only: [:index]

  get  '/pokemons',          to: 'pokemons#show'
  post '/pokemons',          to: 'pokemons#create'
  post '/pokemons/:id/sell', to: 'pokemons#sell', as: 'sell_pokemon'
  get  '/pokemon_not_found', to: 'home#pokemon_not_found'
end
