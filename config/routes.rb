# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :adquired_pokemons, only: [:index]
  resources :profile,           only: [:index]

  get  '/pokemons',          to: 'pokemons#show'
  post '/pokemons',          to: 'pokemons#create'
  get  '/pokemon_not_found', to: 'home#pokemon_not_found'
end
