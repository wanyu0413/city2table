class CoursesController < ApplicationController
  def index
    @courses = Course.all
    skip_policy_scope
  end

  def show
    @course = Course.find(params[:id])
  end
end
