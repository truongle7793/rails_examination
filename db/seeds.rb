# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Activity.seed(:name,
              {:name => 'swimming'},
              {:name => 'climbing'},
              {:name => 'yoga'},
              {:name => 'shooting'},
              {:name => 'hunting'},)
Language.seed(:code,
              {:code => 'en'},
              {:code => 'vn'},
              {:code => 'cs'},
              {:code => 'zh'},
              {:code => 'ar'},
              {:code => 'ru'},)

def random_items(array)
  array.sample(1 + rand(array.count))
end



100.times do |index|
  Guide.seed(:email,
             {:email => Faker::Internet.email, :activity_ids => random_items([1, 2, 3, 4, 5]),
              :language_ids => random_items([1, 2, 3, 4, 5])})

  Review.seed(:id,
              { :score => rand(1..5), :comment => Faker::Quote.most_interesting_man_in_the_world, :guide_id => index + 1},
              { :score => rand(1..5), :comment => Faker::Quote.most_interesting_man_in_the_world, :guide_id => index + 1}
  )
end

