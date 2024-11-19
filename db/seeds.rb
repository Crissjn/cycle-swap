# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "deleting db"
User.delete_all
Bike.delete_all
Booking.delete_all
puts "Starting the creation of 2 users"
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
puts "2 users created"
puts "Creating bikes"
bike1 = Bike.create!(
  bike_type: 'bakfiet',
  size: 'big',
  condition: 'good',
  user: user1,
  address: 'Amsterdam',
  cost_per_day: 10
)
bike2 = Bike.create!(
  bike_type: 'bakfiet',
  size: 'medium',
  condition: 'bad',
  user: user2,
  address: 'Amsterdam',
  cost_per_day: 5
)
puts "bikes create"
puts "creating bookings"

Booking.create!(
  user: user1,
  bike: bike2,
  start_date: DateTime.new(2024, 10, 16, 0, 0, 0),
  end_date: DateTime.new(2024, 10, 20, 0, 0, 0)
)
