class AddAdquiredPokemonsToPokemons < ActiveRecord::Migration[7.0]
  def change
    add_reference :pokemons, :adquired_pokemon, foreign_key: true
  end
end
