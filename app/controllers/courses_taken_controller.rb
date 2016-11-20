class CoursesTakenController < ApplicationController
  def show
  end

  def index
      @courses_taken= Courses_taken.all
  end

  private

    def courses_taken_params
      params.require(:courses_taken).permit(:profile_id, :grade_earned, :course_subject, :course_number, :profimon_name)
    end

end
