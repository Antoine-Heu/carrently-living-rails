# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Créer 20 utilisateurs avec Faker
require "faker"

puts "cleaning the database..."

Car.destroy_all
User.destroy_all

puts "creating users..."

20.times do
  User.create(
    email: Faker::Internet.email,
    password: "password"
  )
end

puts "users created!"

users = User.all.sample(15)

puts "creating cars..."

users.each do |user|
  Car.create!(
    brand: Faker::Vehicle.make,
    model: Faker::Vehicle.model,
    year_of_production: Faker::Date.between(from: '1960-09-23', to: '2019-09-25'),
    address: Faker::Address.full_address,
    price_per_day: Faker::Commerce.price(range: 40..200.0),
    user_id: user.id
  )

  puts "Cars created!"
end

puts "Seed completed!"
