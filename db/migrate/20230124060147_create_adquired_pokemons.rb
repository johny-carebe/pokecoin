# frozen_string_literal: true

class CreateAdquiredPokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :adquired_pokemons do |t|
      t.integer :total_experience, null: false, default: 0

      t.timestamps
    end
  end
end
