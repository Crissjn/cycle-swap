class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike

  validates :start_date, presence: true, comparison: { greater_than: Date.today }
  validates :end_date, comparison: { greater_than: :start_date }, presence: true
end
