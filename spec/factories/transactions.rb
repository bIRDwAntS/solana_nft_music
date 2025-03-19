FactoryBot.define do
  factory :transaction do
    tx_hash { "MyString" }
    seller { nil }
    buyer { nil }
    album { nil }
    track { nil }
    amount { "9.99" }
    transaction_type { 1 }
    status { 1 }
  end
end
