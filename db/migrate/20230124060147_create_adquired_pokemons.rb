class CreateAdquiredPokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :adquired_pokemons do |t|
      t.integer :total_experience
      t.integer :pokemon_id

      t.timestamps
    end
  end
end
