class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy]
	before_action :require_user, except: [:show, :index]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params.merge(user: current_user))
		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @article.update(article_params)
			flash[:success] = "Article was successfully updated"
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end

	def index
		@articles = Article.paginate(page: params[:page], per_page: 5)
	end

	def destroy
		respond_to do |format|
			if @article.destroy
				format.html{redirect_to root_path}
				format.js
			else
				redirect_to :back
			end
		end
	end

	private
		def set_article
			@article = Article.find(params[:id])
		end

		def article_params
			params.require(:article).permit(:title, :description)
		end

		def require_same_user
			if current_user != @article.user and !current_user.admin?
				flash[:danger] = "You can only edit or delete your own articles"
				redirect_to root_path
			end
		end
end