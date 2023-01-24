# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :adquired_pokemons, only: [:index]

  get '/pokemons', to: 'pokemons#show'
  post '/pokemons', to: 'pokemons#create'
  get '/pokemon_not_found', to: 'home#pokemon_not_found'
end
