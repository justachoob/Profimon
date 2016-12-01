class BadgesController < ApplicationController

	def show
    @profile = Profile.find(params[:current_profile_id])
  end


  def create
    change_types
    @badge = Badge.new(badge_params)
    @badge.save
    redirect_to root_url
  end
  
  def self.updateProgress(id, number)
    @badge = Badge.find(id)

    @badge.progress = @badge.progress+number/100
    
    if (@badge.progress>14)
      @badge.completed = true
    end
    
    @badge.save
  end
  
  def destroy
    @badge = Badge.find(params[:id])
    @profileID = @badge.profile_id
    @badge.destroy
    respond_to do |format|
      format.html { redirect_to badge_path( :current_profile_id => @profileID), notice: 'Badge was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	def badge_params
  	params.require(:course).permit(:profile_id, :subject, :course_number)
	end
  
  private

  def change_types
    params[:course_number] = params[:course_number].to_i
    params[:subject] = params[:subject].to_s
    params[:profile_id] = params[:profile_id].to_i
  end

end
