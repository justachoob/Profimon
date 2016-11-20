class CoursesTakenController < ApplicationController
  def show
  end

  def index
      if params[:pname]
        @profile = @Profile.find(params[:pname])
        @courses_takens= @profile.courses_takens.all
      else
        @courses_takens= CoursesTaken.all
      end
  end

  private

	def courses_taken_params
  	params.require(:courses_taken).permit(:profile_id, :grade_earned, :course_subject, :course_number, :profimon_name)
	end

end
	