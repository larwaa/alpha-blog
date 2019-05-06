class Admin::PagesController < AdminController
	def home
		render 'pages/home'
	end

	def about
		render 'pages/about'
	end
end