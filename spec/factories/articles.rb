FactoryBot.define do
  factory :article do
    title { Faker::Lorem.words }
    body { Faker::Lorem.sentence }
    user
  end
end
