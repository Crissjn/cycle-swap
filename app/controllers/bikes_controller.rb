class BikesController < ApplicationController
  def show
    @bike = Bike.find(params[:id])
    @booking = Booking.new
  end
  
  def index
    @bikes = Bike.all
  end

  def show
    @bike = Bike.find(params[:id])
  end
end
