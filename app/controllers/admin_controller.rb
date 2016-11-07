class AdminController < ApplicationController

	#Checks session[:admin] to see if user is an admin or not
	before_action :confirm_admin

	def show
		@user = User.find(params[:id])
	end


end
