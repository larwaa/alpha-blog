class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]

  def index
    @categories = Category.all.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

end