class BookingsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @car = Car.find(params[:car_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])
    @booking.car = @car
    @booking.user = current_user
    if @booking.save
      @booking.update(accepted: true)
      redirect_to car_path(@car), notice: "Booking request sent!"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:starts_at, :ends_at, :user_id, :car_id)
  end
end
