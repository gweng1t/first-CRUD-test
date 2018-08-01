# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
nb_user = 10
nb_city = 10
nb_gossip = 20
# Faker::Address.state
# Faker::Internet.email .password
# Faker::Name.first_name .last_name
# Faker::Job.title .field .position .educatin_level

puts "--- Création de #{nb_city} City ---"
nb_city.times do
	City.create(name: Faker::Address.state, postal_code: Faker::Address.postcode)
end

puts "--- Création de #{nb_user} User ---"
nb_user.times do
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Movie.quote, email: Faker::Internet.email, age: rand(90), city_id: rand(City.first.id..City.last.id))
end

puts "--- Création de #{nb_gossip} Gossip ---"
nb_gossip.times do
	Gossip.create(title: Faker::Job.title, content: Faker::Movie.quote, user_id: rand(User.first.id..User.last.id))
end

