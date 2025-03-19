FactoryBot.define do
  factory :user do
    email { "MyString" }
    username { "MyString" }
    wallet_address { "MyString" }
    bio { "MyText" }
    profile_image { "MyString" }
    artist { false }
    role { 1 }
  end
end
