class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :set_user
  def home
  end

  def dashboard
    @user = current_user
    @user_bikes = @user.bikes
    @user_bookings = @user.bookings
  end
private
  def set_user
    @user = current_user
  end
end
