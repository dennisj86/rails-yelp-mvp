# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "cleaning"
Restaurant.destroy_all

puts "creating"
10.times do
  restaurant = Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_name,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: %w[chinese italian japanese french belgian].sample
  )
  puts "Restaurant #{restaurant.name} created!"
  3.times do
  review = Review.create(
      rating: [1, 2, 3, 4, 5].sample,
      content: Faker::Restaurant.review,
      restaurant_id: restaurant.id
    )
    puts "#{review.restaurant_id}"
  end
end
