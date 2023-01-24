class PokemonsController < ApplicationController
  before_action :find_pokemon

  def show
    if Pokemon.pokemon_not_found(@pokemon)
      return redirect_to root_path
    end

    @pokemon = PokemonService.parser(@pokemon)
    render :show
  end

  private

  def find_pokemon
    @pokemon = PokemonService.get_pokemon(params[:name])
  end
end
