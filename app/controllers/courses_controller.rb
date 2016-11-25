class CoursesController < ApplicationController

	def show
    @profile = Profile.find(params[:current_profile_id])
  end


  def create
   
    change_types
    @course = Course.new(course_params)
    @course.save
    redirect_to root_url
  end

  private

	def course_params
  	params.require(:course).permit(:profile_id, :grade, :subject, :course_number, :profimon_name)
	end

  def change_types
    params[:course_number] = params[:course_number].to_i
    params[:grade] = params[:grade].to_f
    params[:profile_id] = params[:profile_id].to_i
  end

end
