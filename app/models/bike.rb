class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :bike_type, presence: true,
            inclusion: { in: %w(omafiet fat-bike racefiet bakfiet),
                         message: "%{value} is not a valid bike type" }
  validates :size, presence: true,
            inclusion: { in: %(big medium small),
                         message: "%{value} is not a valid bike size" }
  validates :condition, presence: true,
            inclusion:{ in: %(good average bad),
                          message: "${value} is not a valid bike condition" }
  validates :user_id, presence: true
  validates :address, presence: true
  validates :cost_per_day, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :description, presence: true, length: { minimum: 10, maximum: 200 }
end
