# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pokemons', type: :request do
  describe 'GET /show' do
    it 'Return 200 when it exists' do
      get '/pokemons', params: { pokemon_name: 'Rattata' }

      expect(response.status).to have_http_status(:ok)
    end

    it 'Return 400 when does not exists' do
      get '/pokemons', params: { pokemon_name: 'Guilmon' }

      expect(response.status).to have_http_status(:not_found)
    end
  end
end
