# frozen_string_literal: true

class AdquiredPokemon < ApplicationRecord
  has_many :pokemons, dependent: :destroy
end
