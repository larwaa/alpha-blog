class AdminController < ApplicationController
	before_action :require_admin

	def require_admin
		if logged_in? and ! current_user.admin?
			flash[:danger] = "Only admins can perform that action"
			redirect_to root_path
		end
	end
end