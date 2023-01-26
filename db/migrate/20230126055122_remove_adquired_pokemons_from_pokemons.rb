class RemoveAdquiredPokemonsFromPokemons < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemons, :adquired_pokemon_id
  end
end
