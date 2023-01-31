# frozen_string_literal: true

class TransactionsService
  class << self
    def cash_in(user, pokemon)
      bitcoins = calculate_user_bitcoins(user, pokemon)

      create_transaction(user.id, 'check_in', 'sell', pokemon.experience,
                         "Venda do pokemon #{pokemon.name} # #{pokemon.id}")

      user.update(bitcoins:, usd_wallet: calculate_usd_wallet(bitcoins))
    end

    def load_transactions(user_id)
      Transaction.where(user_id:).last(20).reverse
    end

    private

    def calculate_user_bitcoins(user, pokemon)
      user.bitcoins + pokemon.experience
    end

    def bitcoin_usd_sell_value
      BitcoinService.bitcoin_usd_sell_value
    end

    def calculate_usd_wallet(bitcoins)
      (bitcoin_usd_sell_value * bitcoins / 10_000.0).to_i
    end

    def create_transaction(user_id, transaction_type, action, value, description)
      Transaction.create(user_id:, transaction_type:, action:, value:, description:)
    end
  end
end
