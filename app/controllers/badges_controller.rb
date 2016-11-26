class BadgesController < ApplicationController
    
    def show
        @profile = Profile.find(params[:current_profile_id])
    end
    
    def create
        change_types
        @course = Course.new(course_params)
        @course.save
        redirect_to root_url
    end
    
    def badge_params
  	    params.require(:badge).permit(:profile_id, :grade, :subject, :course_number, :profimon_name)
	end
	
	def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to badges_url, notice: 'Badge was successfully destroyed.' }
      format.json { head :no_content }
      end
    end
	
	def change_types
        params[:course_number] = params[:course_number].to_i
        params[:grade] = params[:grade].to_f
        params[:profile_id] = params[:profile_id].to_i
    end
end
