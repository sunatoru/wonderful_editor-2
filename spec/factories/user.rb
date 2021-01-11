FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 10, max_length: 20) }
  end
end
