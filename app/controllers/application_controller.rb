class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  #Helper to confirm if user is logged in, redirects to login if not
  def confirm_logged_in
  	unless session[:user_id]
  		flash[:notice] = "Please Log in."
  		redirect_to(login_path)
  	end
  end

  #Helper to make sure you only access your own account, or are an admin
  def confirm_own_account_page
  #	  unless ((@user_id == session[:user_id])||(session[:admin]))
  #  		flash[:notice] = "That URL is not for your account!"
  #		  redirect_to(user_path( :id => session[:user_id]))
  #	  end
  end

  #Helper to make sure you only access your own class selection page
  def confirm_own_classes_page
    if (Profile.find(params[:profile].to_i).user_id != session[:user_id])
      flash[:notice] = "You cannot take courses for other users!"
      if session[:admin]
        redirect_to admin_path
      else
        redirect_to(user_path( :id => session[:user_id]))
      end
    end
  end

  def confirm_own_class_finish
      if (Profile.find(course_params[:profile_id].to_i).year < ((params[:course][:course_number].to_i)/100).to_i)
        flash[:notice] = "You are not at an appropriate course level to take that course"
    	  redirect_to(user_path( :id => session[:user_id]))
    	elsif (Profile.find(course_params[:profile_id].to_i).user_id != session[:user_id])
    		flash[:notice] = "You cannot take courses for other users!"
    		redirect_to(user_path( :id => session[:user_id]))
    	end
  end


  #Helper to make sure you only access your own battle stuff
  def confirm_enrollment
   	if (Profile.find(params[:profile][:id].to_i).user_id != session[:user_id])
    	  flash[:notice] = "You cannot enroll on behalf of other users!"
   	    redirect_to(user_path( :id => session[:user_id]))

    end
  end

  def confirm_battle
    	if (Profile.find(params[:current_profile_id].to_i).user_id != session[:user_id])
    	  flash[:notice] = "You cannot battle on behalf of other users!"
   	  redirect_to(user_path( :id => session[:user_id]))
   	end
  end

  #Helper to confirm is user is an admin
  def confirm_admin
  	unless session[:admin]
  		flash[:notice] = "You are not an admin."
  		redirect_to(user_path( :id => session[:user_id]))
  	end
  end

end
