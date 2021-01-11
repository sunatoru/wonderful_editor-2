FactoryBot.define do
  factory :coment do
    body { Faker::Lorem.characters(20) }
    user { nil }
    article { nil }
  end
end
