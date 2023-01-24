# frozen_string_literal: true

class User < ApplicationRecord
  has_many :pokemons, through: :adquired_pokemons
end
