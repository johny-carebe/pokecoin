# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    @transactions = TransactionsService.load_transactions(current_user.id)
  end
end
