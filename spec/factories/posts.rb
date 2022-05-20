FactoryBot.define do
  factory :post do
    description { "MyText" }
    image { "MyString" }
    user { nil }
  end
end
