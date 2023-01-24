# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 9_999_999 }
    bitcoins { 0 }
    usd_wallet { 0 }
    name { 'Tester' }
    email
    password { '12345678' }
  end

  sequence(:email) { |n| "test#{n}@test.com" }
end
