class Admin::UsersController < AdminController
	before_action :set_user, only: [:update, :show, :edit]

	def edit
	end

	def show
	end

	def update
		if @user.update(user_params)
			flash[:success] = "The account was updated successfully"
			render "edit"
		else
			render "edit"
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password, :admin)
	end

	def set_user
		@user = User.find(params[:id])
	end

end