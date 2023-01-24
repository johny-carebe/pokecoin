# frozen_string_literal: true

class AdquiredPokemon < ApplicationRecord
  belongs_to :user
  has_many :pokemons, dependent: :destroy
end
