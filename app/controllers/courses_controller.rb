class CoursesController < ApplicationController
  def index
    @course = Courses.all
  end
end
