# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :pokemons, only: [:show]
  get '/pokemons', to: 'pokemons#show'
  get '/pokemon_not_found', to: 'home#pokemon_not_found'
end
