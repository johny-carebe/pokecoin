class DropAdquiredPokemons < ActiveRecord::Migration[7.0]
  def change
    drop_table :adquired_pokemons
  end
end
