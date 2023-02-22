class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @course = Course.find(params[:course_id])
    @booking = Booking.new(booking_params)
    @booking.course = @course
  end

  private
  def booking_params
    params.require(:booking).permit(:start_time, :end_time, :status)
  end
end
