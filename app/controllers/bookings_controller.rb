class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def create
    @course = Course.find(params[:course_id])
    @booking = Booking.new(booking_params)
    @booking.course = @course
    @booking.user = current_user
    authorize @booking
    if @booking.save
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
