class SessionsController < ApplicationController

  
  #Empty action with html for login
  def new
    if session[:user_id]
      redirect_to user_path(:id => session[:user_id])
    end
  end

  #Login action 
  def create
  	if params[:session][:name].present? && params[:session][:password].present?
  		user = User.find_by(name: params[:session][:name])
  		if user
  			authorized_user = user.authenticate(params[:session][:password])
  		end
  	end

  	if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in."

      if authorized_user.admin
        session[:admin] = true
        redirect_to user_path(:id => authorized_user.id)

      else
        session[:admin]= false
        redirect_to user_path(:id => authorized_user.id)
      end
    else
      flash.now[:notice] = "Invalid username/password combination."
      render('new')
    end
  end

  #Logout
  def destroy
    session[:user_id] = nil
    session[:admin] = nil
    flash[:notice] = "You are now logged out."
    redirect_to login_path
  end



end
