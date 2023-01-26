# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    experience { 50 }
    name { 'Rattata' }
    user
  end
end
