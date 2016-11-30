class CoursesController < ApplicationController

	def show
    @profile = Profile.find(params[:current_profile_id])
  end


  def create
   
    change_types
    #@course = Course.new(course_params)
    #@course.save
    #redirect_to controller: 'badges', action: 'create', profile_id: course_params[:profile_id], subject: course_params[:subject], course_number: course_params[:course_number]
    #BadgesController.addClass(course_params[:profile_id], course_params[:course_number], course_params[:subject])
    #redirect_to root_url, notice: "The course and has been added to your progress"
    @profile = Profile.find(course_params[:profile_id])
    @badgeFound = false
    @badge
    @profile.badges.each do |b| #iterate through each of them to see if the badge is there
      if b.subject == course_params[:subject]
          @badge = b
          @badgeFound = true
      end
    end
    if (@badgeFound==true)
      @courseFound = false
      @course
      @badge.courses.each do |c| #iterate through each of them to see if the course is there
        if c.subject == course_params[:subject]
          @course = c
          @courseFound = true
        end
      end
      #if badge found and it has the course in it
      if (@courseFound==true)
        BadgesController.updateClass(@badge.id, course_params[:course_number], course_params[:grade])
      #if badge found but not the course, add the course to it
      else
        @course = Course.new(course_params)
        @course.badge_id = @badge.id
        BadgesController.addClass(@badge.id, course_params[:course_number], course_params[:grade])
      end
    #but if there was no badge (and by extension no course either)
    #make both
    else
      #make badge with course
      @badge = Badge.create(:profile_id => course_params[:profile_id], :subject => course_params[:subject])
      @course = Course.new(course_params)
      @course.badge_id = @badge.id
      BadgesController.addClass(@badge.id, course_params[:course_number], course_params[:grade])
    end
    
    @course.save
    #put a badge.save in its functions
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
  	params.require(:course).permit(:profile_id, :grade, :subject, :course_number, :profimon_name, :badge_id)
	end

  def change_types
    params[:course_number] = params[:course_number].to_i
    params[:grade] = params[:grade].to_f
    params[:profile_id] = params[:profile_id].to_i
    params[:badge_id] = params[:badge_id].to_i
  end

end
