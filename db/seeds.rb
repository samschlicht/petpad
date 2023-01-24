# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# Notes from James
# 'gem install faker' in terminal
# Write 'gem "faker"' in your Gemfile, then bundle install

require 'faker'

User.destroy_all
Pet.destroy_all
Pad.destroy_all
Booking.destroy_all
# List.destroy_all
puts 'destroying everything...'

5.times do
  user = User.create(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
  )
  user.save
end
# description: Faker::Movies::Lebowski.unique.quote
puts 'created 5 users!'

5.times do |i|
  pet = Pet.create(
    user_id: "#{i}.to_i",
    name: Faker::Creature::Dog.unique.name,
    species: Faker::Creature::Dog.unique.breed,
    comments: Faker::Creature::Bird.unique.emotional_adjective
  )
  pet.save
end
puts 'created 5 pets for the 5 users!'

5.times do |i|
  pad = Pad.create(
    user_id: "#{i}.to_i",
    address: Faker::Address.unique.street_address,
    title: Faker::Emotion.unique.noun,
    description: Faker::Movies::Lebowski.unique.quote,
    price_per_night: (0...100).to_a.sample,
    capacity: (0...10).to_a.sample,
    availability: true
  )
  pad.save
end
puts 'created 5 pads for the 5 users!'

# Future random images
# https://source.unsplash.com/random/
