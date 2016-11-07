class UsersController < ApplicationController

  #Action to restrict access if user is not logged in
  #Must be added to every controller if you want to restrict access
  before_action :confirm_logged_in, :except => [:new , :create]



  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end



  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "Signup successful"
  		params[:user] = {:id=> @user.id}
      session[:user_id] = @user.id
      if @user.admin
        session[:admin] = true;
        redirect_to user_path(:id => @user.id)
      else
  		  redirect_to user_path(:id => @user.id)
      end
  	else
  		flash[:notice] = "Error with your signup"
  		render :new
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

   private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :id, :admin)
  end

end
