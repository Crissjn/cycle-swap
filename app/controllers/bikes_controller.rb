class BikesController < ApplicationController
  before_action :set_user

  def show
    @bike = Bike.find(params[:id])
    @booking = Booking.new
  end

  def index
    @bikes = Bike.all
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude
      }
    end
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = @user
    if @bike.save
      redirect_to dashboard_path, notice: "bike created succesfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to dashboard_path, status: :see_other, alert: "bike deleted!"
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    @bike = Bike.find(params[:id])
    @bike.update(bike_params)
    redirect_to dashboard_path
  end

  private

  def bike_params
    params.require(:bike).permit(:bike_type, :condition, :size, :photo, :address, :description, :cost_per_day)
  end

  def set_user
    @user = current_user
  end
end
