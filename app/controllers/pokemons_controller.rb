# frozen_string_literal: true

class PokemonsController < ApplicationController
  before_action :pokeapi_get, only: [:create]

  def index
    @pokemons = Pokemon.where(user_id: current_user.id)
  end

  def create
    return redirect_to not_found_pokemons_path if @pokemon.body == 'Not Found'

    pokemon_information = PokemonsService.parser(@pokemon)
    @pokemon = Pokemon.create(name: pokemon_information[:name].capitalize,
                              experience: pokemon_information[:base_experience],
                              user_id: current_user.id)

    redirect_to pokemons_path
  end

  def sell
    pokemon = Pokemon.find_by(id: params[:id])

    TransactionsService.cash_in(current_user, pokemon) if pokemon.delete
    redirect_to pokemons_path
  end

  def not_found; end

  private

  def pokeapi_get
    @pokemon = PokemonsService.get_pokemon(params[:name])
  end
end
