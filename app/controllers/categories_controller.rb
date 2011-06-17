class CategoriesController < ApplicationController

  def index
    @title = "All Categories"
	@categories = Category.all
  end
  def show
    @category = Category.find(params[:id])
	@title = @category.name
  end

end
