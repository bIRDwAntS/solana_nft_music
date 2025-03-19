FactoryBot.define do
  factory :album do
    title { "MyString" }
    cover_image { "MyString" }
    description { "MyText" }
    release_date { "2025-03-19" }
    user { nil }
    nft_address { "MyString" }
    royalty_percentage { "9.99" }
    mint_status { 1 }
  end
end
