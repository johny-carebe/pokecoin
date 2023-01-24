# frozen_string_literal: true

class AddExperienceToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :experience, :integer
  end
end
