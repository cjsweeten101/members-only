class SessionsController < ApplicationController

	def new
		@user = current_user
	end

	def create
		user = User.find_by(email: params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			flash[:success] = "Logged in successfuly"
			log_in user
			@user = user
			redirect_to root_url
		else
			flash.now[:danger] = "Wrong email/password combination"
			render 'new'
		end
	end

	def destroy
		@user = current_user
		log_out @user
		flash[:success] = "Logged out successfuly"
		redirect_to root_url
	end
end
