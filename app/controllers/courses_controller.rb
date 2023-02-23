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

  def new
    @course = Course.new
    authorize @course
  end

  def create
    @course = Course.new(course_params)
    @course.user = current_user
    authorize @course
    if @course.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def course_params
    params.require(:course).permit(:category, :price, :name)
  end
end
