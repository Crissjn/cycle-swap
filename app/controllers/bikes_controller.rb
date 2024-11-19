class BikesController < ApplicationController
  def show
    @bike = Bike.find(params[:id])
    @booking = Booking.new
  end
end
