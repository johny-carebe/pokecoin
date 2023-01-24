# frozen_string_literal: true

class PokemonsController < ApplicationController
  before_action :find_pokemon

  def show
    return redirect_to pokemon_not_found_path if Pokemon.pokemon_not_found(@pokemon)

    @pokemon = PokemonService.parser(@pokemon)
    render :show
  end

  def create
    return redirect_to pokemon_not_found_path if Pokemon.pokemon_not_found(@pokemon)

    pokemon_information = PokemonService.parser(@pokemon)
    adquired_pokemon = AdquiredPokemon.find_by(user_id: current_user.id)
    @pokemon = Pokemon.new(
      name: params[:name],
      experience: pokemon_information[:base_experience],
      adquired_pokemon_id: adquired_pokemon.id
    )
    redirect_to adquired_pokemons_path if @pokemon.save
  end

  private

  def find_pokemon
    @pokemon = PokemonService.get_pokemon(params[:name])
  end
end
