class Bike < ApplicationRecord
  belongs_to :users
  has_many :bookings
  has_one_attached :photo
end
