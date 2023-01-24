# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    id { 9_999_999 }
    name { 'Tester' }
    email
    password { '12345678' }
  end

  sequence(:email) { |n| "test#{n}@test.com" }
end
