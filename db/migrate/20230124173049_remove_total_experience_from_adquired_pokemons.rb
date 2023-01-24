class RemoveTotalExperienceFromAdquiredPokemons < ActiveRecord::Migration[7.0]
  def change
    remove_column :adquired_pokemons, :total_experience, :integer
  end
end
