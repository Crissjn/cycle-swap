class BikesController < ApplicationController
  before_action :set_user

  def show
    @bike = Bike.find(params[:id])
    @booking = Booking.new
    # @current_user = current_user
  end

  def index
    @bikes = Bike.all
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

  private

  def bike_params
    params.require(:bike).permit(:bike_type, :condition, :size, :photo, :address, :description, :cost_per_day)
  end

  def set_user
    @user = current_user
  end
end
