class BookingsController < ApplicationController
  def create
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new(booking_params)
    @booking.bike = @bike
    @booking.user = current_user
    @marker = [{
      lat: @bike.latitude,
      lng: @bike.longitude
    }]
    #save booking to database
    #if succesful redirects to bikes page with a message
    #if unsuccesful redirects to page with an error message
    if @booking.save
      redirect_to :dashboard, notice: "booking succesful"

    else
      render "bikes/show", status: :unprocessable_entity
    end
  end

  private
  #ensure only permitted parameters are allowed to create a booking/update
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
