FactoryBot.define do
  factory :review do
    score { 5 }
    comment { "MyText" }
    guide { association(:guide) }
  end
end
