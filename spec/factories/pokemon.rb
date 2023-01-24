# frozen_string_literal: true

FactoryBot.define do
  factory :pokemon do
    adquired_pokemon
    experience { 50 }
  end
end
