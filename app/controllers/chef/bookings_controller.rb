class Chef::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:chef, Booking])
  end

  def update
    @booking = Booking.find(params[:id])
    if booking.update(booking_params)
      redirect_to bookings_path
    else
      render "courses/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status)
  end
end
