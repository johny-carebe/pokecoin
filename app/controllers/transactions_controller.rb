# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.where(user_id: current_user.id).last(20)
  end
end
