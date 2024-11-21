# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts "deleting db"
Booking.delete_all
Bike.delete_all
User.delete_all

puts "Starting the creation of users"
user1 = User.create!(
  username: 'JohnDoe',
  email: 'john@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
user2 = User.create!(
  username: 'rick87',
  email: 'rick@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
kelvin = User.create!(
  username: 'kelvin',
  email: 'kelvin@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
james = User.create!(
  username: 'james',
  email: 'james@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)
rodrigo = User.create!(
  username: 'rodrigo',
  email: 'rodrigo@gmail.com',
  password: 'topsecret',
  password_confirmation: 'topsecret'
)

puts "users created"
puts "creating picture"

file = URI.parse("https://surlybikes.com/uploads/bikes/surly-midnight-special-bike-fools-gold-BK00614-800x600.jpg").open
file2 = URI.parse("https://www.nltweewielers.nl/wp-content/uploads/2023/05/742-bakfietsnl-cargo-classic-long-steps-middenmotor-matlegergroen-1-600x400.jpg").open
file3 = URI.parse("https://images.marktplaats.com/api/v1/listing-mp-p/images/d5/d596eb88-c7c4-4cb8-af3b-2781375016e4?rule=ecg_mp_eps$_83").open
file4 = URI.parse("https://www.nexttoskinitaliashop.it/wp-content/uploads/2024/02/FAT-BIKE-ENERGIA-REAL.jpg").open
puts "pice created"
puts "creating bikes"

bike1 = Bike.new(
  bike_type: 'race bike',
  size: 'big',
  condition: 'good',
  user: user1,
  address: 'IJsbaanpad 9, 1076 CV Amsterdam',
  cost_per_day: 10,
  description: "Really nice bike to ride. Fast to move in the city but no storage capacity. "
)
bike1.photo.attach(io: file, filename: "racefiet.png", content_type: "image/png")
bike1.save

bike2 = Bike.new(
  bike_type: 'race bike',
  size: 'medium',
  condition: 'average',
  user: user2,
  address: 'Johan Cruijff Boulevard 1, 1101 AX Amsterdam',
  cost_per_day: 5,
  description: "This was my first bike here in the Netherlands. Tires are brand new but the seat is not too confortable. "
)
bike2.photo.attach(io: file, filename: "racefiet.png", content_type: "image/png")
bike2.save

bike3 = Bike.new(
  bike_type: 'cargo bike',
  size: 'small',
  condition: 'good',
  user: user1,
  address: 'Museumstraat 1, 1071 XX Amsterdam',
  cost_per_day: 5,
  description: "Ideal if you have to move a lot of things in the city. Need a bit of practice to get used to it. "
)
bike3.photo.attach(io: file2, filename: "racefiet.png", content_type: "image/png")
bike3.save

bike4 = Bike.new(
  bike_type: 'city bike',
  size: 'medium',
  condition: 'average',
  user: user1,
  address: 'IJburglaan 719, 1087 BS Amsterdam',
  cost_per_day: 5,
  description: "Best way to visit Amsterdam like a real amsterdammer!"
)
bike4.photo.attach(io: file3, filename: "omafiet.png", content_type: "image/png")
bike4.save

bike5 = Bike.new(
  bike_type: 'city bike',
  size: 'medium',
  condition: 'average',
  user: rodrigo,
  address: 'Meer en Vaart 300, 1068 LE Amsterdam',
  cost_per_day: 5,
  description: "Pedal brakes need a bit of practice.Nice basket in the front to have extra storage. "
)
bike5.photo.attach(io: file3, filename: "omafiet.png", content_type: "image/png")
bike5.save

bike6 = Bike.new(
  bike_type: 'fat bike',
  size: 'medium',
  condition: 'good',
  user: james,
  address: 'Amstel Station, Amsterdam',
  cost_per_day: 5,
  description: "Electric fat bike.Ideal if you don't want to sweat too much. "
)
bike6.photo.attach(io: file4, filename: "fat-bike.png", content_type: "image/png")
bike6.save

bike7 = Bike.new(
  bike_type: 'fat bike',
  size: 'medium',
  condition: 'good',
  user: kelvin,
  address: 'Centraal Station, Amsterdam',
  cost_per_day: 5,
  description: "This fat bike is brand new, barely used."
)
bike7.photo.attach(io: file4, filename: "fat-bike.png", content_type: "image/png")
bike7.save

bike8 = Bike.new(
  bike_type: 'city bike',
  size: 'medium',
  condition: 'good',
  user: kelvin,
  address: 'Dam Square, Amsterdam',
  cost_per_day: 15,
  description: "Great bike to go around with friends. Not good during rainy days. "
)
bike8.photo.attach(io: file3, filename: "fat-bike.png", content_type: "image/png")
bike8.save

puts "bikes created"
puts "creating bookings"
Booking.insert_all([
  { user_id: kelvin.id,
    bike_id: bike4.id,
    start_date: DateTime.new(2024, 8, 16, 0, 0, 0),
    end_date: DateTime.new(2024, 8, 20, 0, 0, 0) },
  { user_id: kelvin.id,
    bike_id: bike2.id,
    start_date: DateTime.new(2024, 9, 21, 0, 0, 0),
    end_date: DateTime.new(2024, 9, 25, 0, 0, 0) }
                   ])
Booking.create!(
  user: user1,
  bike: bike2,
  start_date: DateTime.new(2025, 10, 16, 0, 0, 0),
  end_date: DateTime.new(2025, 10, 20, 0, 0, 0)
)

Booking.create!(
  user: james,
  bike: bike4,
  start_date: DateTime.new(2025, 9, 29),
  end_date: DateTime.new(2025, 10, 9)
)


puts "booking created"
