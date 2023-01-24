FactoryBot.define do
  factory :transaction do
    transaction_type { "MyString" }
    action { "MyString" }
    value { 1 }
    destription { "MyString" }
  end
end
