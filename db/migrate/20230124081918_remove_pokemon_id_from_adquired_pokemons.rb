class RemovePokemonIdFromAdquiredPokemons < ActiveRecord::Migration[7.0]
  def change
    remove_column :adquired_pokemons, :pokemon_id, :integer
  end
end
