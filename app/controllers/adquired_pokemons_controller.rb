class AdquiredPokemonsController < ApplicationController
  def index
    adquired_pokemon = AdquiredPokemon.last
    @pokemons = Pokemon.where(adquired_pokemon_id: adquired_pokemon.id)
  end
end
