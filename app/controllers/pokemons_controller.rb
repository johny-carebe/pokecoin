# frozen_string_literal: true

class PokemonsController < ApplicationController
  before_action :pokeapi_get, only: [:create]

  def index
    @pokemons = PokemonsService.load(current_user.id)
  end

  def create
    return redirect_to not_found_pokemons_path if @pokemon.body == 'Not Found'

    @pokemon = PokemonsService.create(@pokemon, current_user.id)

    redirect_to pokemons_path
  end

  def sell
    pokemon = PokemonsService.find(params[:id])

    TransactionsService.cash_in(current_user, pokemon) if pokemon.delete
    redirect_to pokemons_path
  end

  def not_found; end

  private

  def pokeapi_get
    @pokemon = PokemonsService.get_pokemon_from_pokeapi(params[:name])
  end
end
