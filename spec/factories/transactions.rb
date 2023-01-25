# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    transaction_type { 'check_in' }
    action { 'sell' }
    value { 150 }
    description
  end

  sequence(:description) { |n| "Venda do pokemon Rattata # #{n}" }
end
