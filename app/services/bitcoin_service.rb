# frozen_string_literal: true

class BitcoinService
  class << self
    def bitcoin_usd_sell_value
      bitcoin_coin_values[:USD][:sell]
    end

    private

    def bitcoin_coin_values
      parser(bitcoin_coin_values_json)
    end

    def bitcoin_coin_values_json
      conn.get('/ticker')
    end

    def parser(response)
      JSON.parse(response.body, symbolize_names: true)
    end

    def conn
      Faraday.new('https://blockchain.info')
    end
  end
end
