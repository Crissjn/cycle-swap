class Booking < ApplicationRecord
  belongs_to :users
  belongs_to :bikes
end