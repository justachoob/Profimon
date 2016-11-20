class CoursesTakenController < ApplicationController
  def show
  end
  private



	def courses_taken_params
  	params.require(:courses_taken).permit(:profile_id, :grade_earned, :course_subject, :course_number, :profimon_name)
	end

end
	