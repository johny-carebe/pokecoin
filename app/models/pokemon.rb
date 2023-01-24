class Pokemon < ApplicationRecord
  class << self
    def pokemon_not_found(pokemon)
      pokemon.body == 'Not Found'
    end
  end
end
