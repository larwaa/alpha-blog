class ArticlesController < ApplicationController
	before_action :set_article, only: [:show, :edit, :update, :destroy, :forward]

	def new
		@article = Article.new
		@articles = Article.all
	end

	def create
		debugger
		@article = Article.new(article_params)
		@article.user = User.first
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
		@articles = Article.all
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
end