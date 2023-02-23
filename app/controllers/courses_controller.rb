class CoursesController < ApplicationController
  skip_before_action :authenticate_user!, only:[:index, :show]
  def index
    @courses = policy_scope(Course)
  end

  def show
    @course = Course.find(params[:id])
    # skip_authorization
    authorize @course
    @booking = Booking.new
  end

  def login
    @courses = Course.new(course_params)
    i
  end
end
