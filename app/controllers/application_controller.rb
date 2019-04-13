class ApplicationController < ActionController::Base

	helper_method :current_user, :logged_in?, :current_company, :company_logged_in?

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		!!current_user
	end

	def require_user
		if !logged_in?
			flash[:danger] = "You must be logged in to access this"
			redirect_to root_path
		end
	end

	def current_company
		@current_company ||= Company.find_by(user: current_user) if logged_in?
	end

	def company_logged_in?
		!!current_company
	end
end
