# frozen_string_literal: true

class PokemonsService
  class << self
    def get_pokemon_from_pokeapi(pokemon_name)
      conn.get("/api/v2/pokemon/#{pokemon_name.downcase}/")
    end

    def create(pokemon, user_id)
      pokemon_information = parser(pokemon)

      Pokemon.create(user_id:, name: pokemon_information[:name].capitalize,
                     experience: pokemon_information[:base_experience])
    end

    def load(user_id)
      Pokemon.where(user_id:)
    end

    def find(id)
      Pokemon.find_by(id:)
    end

    private

    def parser(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('https://pokeapi.co')
    end
  end
end
