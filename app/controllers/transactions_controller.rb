# frozen_string_literal: true

class TransactionsController < ApplicationController
  def show
    @transactions = Transaction.where(user_id: current_user.id).last(20)
  end

  def transaction_sell_pokemon
    pokemon = Pokemon.find_by(id: params[:id])
    bitcoins = current_user.bitcoins + pokemon.experience
    bitcoin_usd_sell_value = BitcoinService.bitcoin_usd_sell_value
    usd_wallet = (bitcoin_usd_sell_value * bitcoins / 10_000.0).to_i

    current_user.update(bitcoins:, usd_wallet:)
    Transaction.create(user_id: current_user.id, transaction_type: 'check_in', action: 'sell',
                       value: pokemon.experience, description: "Venda do pokemon #{pokemon.name} # #{pokemon.id}")
    redirect_to adquired_pokemons_path if pokemon.delete
  end
end
