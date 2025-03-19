FactoryBot.define do
  factory :track do
    title { "MyString" }
    duration { 1 }
    audio_file { "MyString" }
    album { nil }
    track_number { 1 }
    nft_address { "MyString" }
    individual_sale { false }
    price { "9.99" }
  end
end
