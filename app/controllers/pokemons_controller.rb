# frozen_string_literal: true

class PokemonsController < ApplicationController
  def show
    response = conn.get("/api/v2/pokemon/#{params[:name].downcase}")

    return redirect_to root_path, status: :not_found if response.body == 'Not Found'

    parse(response)
    render :show, status: :ok
  end

  private

  def conn
    Faraday.new('https://pokeapi.co')
  end

  def parse(response)
    @pokemon = JSON.parse(response.body, symbolize_names: true)
  end
end
