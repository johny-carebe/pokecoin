# frozen_string_literal: true

class TransactionsService
  class << self
    def cash_in(user, pokemon)
      bitcoins = user.bitcoins + pokemon.experience
      bitcoin_usd_sell_value = BitcoinService.bitcoin_usd_sell_value
      usd_wallet = (bitcoin_usd_sell_value * bitcoins / 10_000.0).to_i

      Transaction.create(user_id: user.id, transaction_type: 'check_in', action: 'sell',
                         value: pokemon.experience, description: "Venda do pokemon #{pokemon.name} # #{pokemon.id}")

      user.update(bitcoins:, usd_wallet:)
    end
  end
end
