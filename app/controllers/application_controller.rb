class ApplicationController < ActionController::Base
	helper_method :current_user, :logged_in?, :current_company, :company_logged_in?, :admin_namespace?

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

	def require_admin
		unless ! current_user.nil? and current_user.admin?
			flash[:danger] = "Only admins can perform that action"
			redirect_to root_path
		end
	end

	def admin_namespace?
		self.class.name.split("::").first == "Admin"
	end

	def current_company
		@current_company ||= (logged_in? and ! current_user.admin?) ? current_user.company : nil
	end

	def company_logged_in?
		!!current_company
	end
end
