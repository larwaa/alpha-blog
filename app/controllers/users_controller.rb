class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update, :show, :destroy]
	before_action :require_same_user, only: [:edit, :update]
	before_action :require_admin, only: [:destroy]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = user_params[:user_id]
			flash[:success] = "Welcome to Bindeleddet #{user_params[:username]}"
			redirect_to root_path
		else
			render "new"
		end
	end

	def edit

	end

	def update
		if @user.update(user_params)
			flash[:success] = "Your account was updated successfully"
			redirect_to articles_path
		else
			render "edit"
		end
	end

	def show
		@user_articles = @user.articles.paginate(page: params[:page], per_page: 5)
	end

	def index
		@users = User.paginate(page: params[:page], per_page: 5)
	end

	def destroy
		if @user.destroy
			flash[:danger] = "#{@user.username} and all articles created by #{@user.username} have been deleted"
		end
	end

	def add_company
		@user = current_user
		@user.company = params[:company]
		if @user.save
			flash[:success] = "Company added successfully"
		else
			redirect_to user_path(@user)
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user and !current_user.admin?
			flash[:danger] = "You can only edit your own profile!"
			redirect_to root_path
		end
	end

	def require_admin
		if logged_in? and !current_user.admin?
			flash[:danger] = "Only admins can perform that action"
			redirect_to root_path
		end
	end
end