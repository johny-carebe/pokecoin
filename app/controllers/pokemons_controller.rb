# frozen_string_literal: true

class PokemonsController < ApplicationController
  before_action :find_pokemon, only: %i[show create]

  def show
    return redirect_to pokemon_not_found_path if PokemonService.pokemon_not_found(@pokemon)

    @pokemon = PokemonService.parser(@pokemon)
    render :show
  end

  def create
    return redirect_to pokemon_not_found_path if PokemonService.pokemon_not_found(@pokemon)

    pokemon_information = PokemonService.parser(@pokemon)
    adquired_pokemon = AdquiredPokemon.find_by(user_id: current_user.id)
    @pokemon = Pokemon.new(
      name: params[:name],
      experience: pokemon_information[:base_experience],
      adquired_pokemon_id: adquired_pokemon.id
    )
    redirect_to adquired_pokemons_path if @pokemon.save
  end

  def sell
    pokemon = Pokemon.find_by(id: params[:id])
    current_user.update(bitcoins: current_user[:bitcoins] + pokemon[:experience])
    redirect_to adquired_pokemons_path if pokemon.delete
  end

  private

  def find_pokemon
    @pokemon = PokemonService.get_pokemon(params[:name])
  end
end
