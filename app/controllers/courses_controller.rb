class CoursesController < ApplicationController

	def show
    @profile = Profile.find(params[:current_profile_id])
  end


  def create
   
    change_types
    @course = Course.new(course_params)
    @course.save
    #make the bade no matter what, check for the grade later
    #redirect_to controller: 'badges', action: 'create', profile_id: course_params[:profile_id], subject: course_params[:subject], course_number: course_params[:course_number]
    if (@course.grade>2)
      BadgesController.addClass(course_params[:profile_id], course_params[:course_number], course_params[:subject])
      redirect_to root_url, notice: "You passed the course and it has been added to your progress"
    else
      redirect_to root_url, notice: "You failed the course and it has not been added to your progress"
    end
  end
  
  
  def destroy
    @course = Course.find(params[:id])
    @profileID = @course.profile_id
    @course.destroy
    respond_to do |format|
      format.html { redirect_to course_path( :current_profile_id => @profileID), notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
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
