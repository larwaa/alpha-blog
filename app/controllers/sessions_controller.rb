class SessionsController < ApplicationController
	def new

	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user and user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have been logged in"
			redirect_to root_path
		else
			flash.now[:danger] = "There something wrong with your login information"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "You have been logged out"
		redirect_to root_path
	end
end