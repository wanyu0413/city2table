class Chef::BookingsController < ApplicationController
  def index
    @bookings = policy_scope([:chef, Booking])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status)
  end
end
