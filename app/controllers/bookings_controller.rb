class BookingsController < ApplicationController
  before_action :set_booking, only: [:update]
  def index
    @bookings = current_user.bookings
  end
  def update
    # Vérifie que seul le vendeur peut changer le statut
    if current_user == @booking.seller
      if params[:status] == 'accepted'
        @booking.update(status: 'accepted')
        flash[:notice] = "Booking accepted!"
      elsif params[:status] == 'denied'
        @booking.update(status: 'denied')
        flash[:alert] = "Booking denied!"
      else
        flash[:alert] = "Invalid status"
      end
    else
      flash[:alert] = "You are not authorized to perform this action."
    end
    redirect_to bookings_path # Redirige vers la liste des réservations
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
