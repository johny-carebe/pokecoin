# frozen_string_literal: true

class PokemonsController < ApplicationController
  def show
    render :show, status: :ok
  end
end
