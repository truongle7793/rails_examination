FactoryBot.define do
  factory :guide do
    email { Faker::Internet.email }
  end
end
