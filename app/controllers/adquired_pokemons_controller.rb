# frozen_string_literal: true

class AdquiredPokemonsController < ApplicationController
  before_action :load_pokemons, only: [:index]

  def index; end

  private

  def user_adquired_pokemons
    AdquiredPokemon.find_by(user_id: current_user.id)
  end

  def adquired_pokemon
    AdquiredPokemon.create(user_id: current_user.id) if user_adquired_pokemons.nil?

    user_adquired_pokemons
  end

  def load_pokemons
    @pokemons = Pokemon.where(adquired_pokemon_id: adquired_pokemon.id)
  end
end
