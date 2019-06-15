class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:success]
      redirect_to categories_path
    else
      render 'new'
    end
  end

  private
  def category_params
    params.require("category").permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end