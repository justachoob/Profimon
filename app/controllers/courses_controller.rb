class CoursesController < ApplicationController
  
  before_action :confirm_logged_in
  #before_action :confirm_enrollment
  before_action :confirm_own_class_finish, only: [:create]
  
	def show
    @profile = Profile.find(params[:current_profile_id])
  end


  def create
   
    change_types
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
        if (c.course_number.to_i == course_params[:course_number].to_i)
          @course = c
          @courseFound = true
        end
      end
      #if badge found and it has the course in it
      if (@courseFound==true)
        updateCourse(@course, course_params[:grade])
      #if badge found but not the course, add the course to it
      else
        @course = Course.new(course_params)
        @course.badge_id = @badge.id
        @course.save
        updateCourse(@course, @course.grade)
      end
    #but if there was no badge (and by extension no course either)
    #make both
    else
      #make badge with course
      @badge = Badge.create(:profile_id => course_params[:profile_id], :subject => course_params[:subject])
      @course = Course.new(course_params)
      @course.save
      @course.badge_id = @badge.id
      updateCourse(@course, @course.grade)
    end
  
    @course.save
    redirect_to root_url, notice: "The course has been added to your progress"
  end
  
  def updateCourse(target, grade)
    
    if ((target.status==0)&&(target.timesTaken<3))#if there's reason to potentially update
    target.grade = grade
      if (grade.to_f>1)
        target.status=1
        BadgesController.updateProgress(target.badge_id, target.course_number)
      end
    end
    #increment times taken
    target.timesTaken = target.timesTaken+1
    
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
