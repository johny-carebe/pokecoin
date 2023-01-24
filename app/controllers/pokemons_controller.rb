class PokemonsController < ApplicationController
  before_action :find_pokemon

  def show
    return redirect_to pokemon_not_found_path if Pokemon.pokemon_not_found(@pokemon)

    @pokemon = PokemonService.parser(@pokemon)
    render :show
  end

  private

  def find_pokemon
    @pokemon = PokemonService.get_pokemon(params[:name])
  end
end
