# frozen_string_literal: true

class PokemonsService
  class << self
    def get_pokemon(pokemon_name)
      conn.get("/api/v2/pokemon/#{pokemon_name.downcase}/")
    end

    def parser(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    private

    def conn
      Faraday.new('https://pokeapi.co')
    end
  end
end
