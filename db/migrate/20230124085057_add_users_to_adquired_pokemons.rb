# frozen_string_literal: true

class AddUsersToAdquiredPokemons < ActiveRecord::Migration[7.0]
  def change
    add_reference :adquired_pokemons, :user, foreign_key: true
  end
end
