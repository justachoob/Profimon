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
	
  def self.addClass(id, number, subject)
    @profile = Profile.find(id)
    @year = number.to_i/100
    @badgeFound = false
    @profile.badges.each do |b| #iterate through each of them to see if the badge is there
      if @b.subject == subject
          @badge = @b
          @badgeFound = true
      end
    end
    
    #otherwise make a new badge
    if (@badgeFound!=true)
      #change_types
      #@badge = Badge.new(params)
      @badge = Badge.create(:profile_id => id, :subject => subject)
      @badge.subject = subject
    end
    #increment the appropriate year
    if @year == 1
      #@badge.first_year = @badge.first_year+1
    elsif @year == 2
      #@badge.second_year = @badge.second_year+1
    elsif @year == 3
      #@badge.third_year = @badge.third_year+1
    elsif @year == 4
      #@badge.fourth_year = @badge.fourth_year+1
    end
    
    #if (@badge.first_year>0) && (@badge.first_year>0) && (@badge.first_year>0) && (@badge.fourth_year>0)
    #    @badge.finished = true;
    #end
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
    params.require(:badge).permit(:profile_id, :subject)
  end
	
  def change_types
        params[:subject] = params[:subject].to_s
        params[:profile_id] = params[:profile_id].to_i
  end
end
