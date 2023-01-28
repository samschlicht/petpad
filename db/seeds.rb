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

Booking.destroy_all
Pad.destroy_all
Pet.destroy_all
User.destroy_all

puts 'destroying everything...'

10.times do
  User.create!(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.unique.last_name,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.unique.password
  )
end
puts 'created 10 users!'

10.times do
  Pet.create!(
    user: User.all.sample,
    name: Faker::Creature::Dog.unique.name,
    species: Faker::Creature::Dog.unique.breed,
    comments: Faker::Creature::Bird.unique.emotional_adjective
  )
end
puts 'created 10 pets for the 10 users!'

10.times do
  Pad.create!(
    user: User.all.sample,
    address: Faker::Address.unique.street_address + ", " + Faker::Address.unique.city,
    title: ['Happy Villa', 'Hold-Your-Nose Stables', 'The Lap of Luxury', 'The Dirty Litter Tray', 'Leave Your Pet and Walk Away', 'The Shitbox', 'Marvellous Menagerie', 'Crib Chameleon', 'The Hungry Snake', 'Velvet Cushions', 'Saucer From Heaven', 'Gerbil Redoubt', 'The Happy Hippo', 'Animal Allotments', 'High-Security Prison for Doomed Pets', 'A Cell From Home', 'Glorious and Future Pet Re-Education Centre', 'Negligent Manor', 'Pet Retreat Mindful Meditation Centre'].sample,
    description: ['Pack up your troubles and come to pet heaven.', 'No snakes allowed.', 'I got 99 problems but a bitch aint one.', 'Home is where I lay my cat.', 'Catnip on tap, no tabbies please.', 'No lazy sloths, pets clean up after themselves.', 'A civilized hangout for pets who like to read. No mobile phones.', 'Swimming pool and drone flying for more skilled animals.', 'Serious discipline for your unruly little smashers.', 'Foie gras on the reg.', 'Absolutely under no circumstances will we accept snakes or dogs.', 'We expect pets to work for their supper. More of a factory than a holiday home — good for ill-disciplined little devils.', 'Ask me no questions and I will tell you no lies', 'Teachers of morality for your nihilistic gerbils.', 'Each evening, we eat the weakest pet!'].sample,
    price_per_night: (0...100).to_a.sample,
    capacity: (0...10).to_a.sample,
    availability: true
  )
end
puts 'created 10 pads for the 10 users!'

# Future random images
# https://source.unsplash.com/random/
