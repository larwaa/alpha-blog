class Admin::UsersController < AdminController

	def edit
		@user = User.find(params[:id])
	end

	def show
		@user = User.last
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

end