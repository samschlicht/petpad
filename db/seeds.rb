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
    first_name: Faker::Name.unique.first_name.capitalize,
    last_name: Faker::Name.unique.last_name.capitalize,
    email: Faker::Internet.unique.email,
    password: Faker::Internet.unique.password
  )
end
puts 'created 10 users!'

10.times do
  Pet.create!(
    user: User.all.sample,
    name: Faker::Creature::Dog.unique.name.capitalize,
    species: ['Dog', 'Cat', 'Bird', 'Lizard', 'Snake',].sample,
    comments: ['My pet is my life', 'This is not a pet, this is family!', 'Don"t pet my pet', 'This is the love of my life', 'This is also my support animal', 'My best friend, no doubt about it',].sample
  )
end
puts 'created 10 pets for the 10 users!'

10.times do
  Pad.create!(
    user: User.all.sample,
    address: ['Ginza', 'Shibuya', 'Asakusa', 'Shinjuku', 'Harajuku', 'Akihabara', 'Kagurazaka', 'Kichijoji', 'Daikanyama', 'Shimokitazawa', 'Ikebukuro', 'Nakameguro', 'Roppongi', 'Omotesando',].sample + ", " + "Tokyo",
    title: ['Happy Villa', 'Home away from home', 'The Lap of Luxury', 'The Pet Lounge', 'Leave Your Pet and Walk Away', 'The Club House', 'Marvellous Menagerie', 'Crib Chameleon', 'The Italian Happy Family', 'Velvet Cushions', 'Saucers From Heaven', 'Gerbil Redoubt', 'The Happy Hippo', 'Animal Allotments', 'High End Luxury for Pets', 'A Couch Next Dorr', 'Glorious and Future Pet Home', 'Magnificent Manor', 'Pet Retreat and Meditation Centre'].sample,
    description: ['Leave your pets in good hands.', 'We also have pets in the back.', '99 reasons to leave your pet here.', 'As safe as safe can be.', 'Lots of room, for your pets too!', 'Lots of experience in cleaning after your pets.', 'Bed and Breakfast for the busy pet owner.', 'Your pets will be loved.', 'We are serious about our pets and also yours.', 'Pet.care that is us.', 'We will love your pets unconditionally.', 'Lots of room for your pets to run and roam.', 'I will love them like my own children.', 'We make your pets our business.', 'All pets are equal!'].sample,
    price_per_night: (0...100).to_a.sample,
    capacity: (0...10).to_a.sample,
    availability: true,
    welcome_species: ['dogs', 'cats', 'birds', 'lizards', 'snakes',].sample(rand(1...3)),
  )
end
puts 'created 10 pads for the 10 users!'

User.create!(
  first_name: 'Ander',
  last_name: 'Lyle',
  email: 'email@gmail.com',
  password: '123456'
)
puts 'created Ander Lyle!'
