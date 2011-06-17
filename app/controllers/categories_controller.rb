class CategoriesController < ApplicationController

  def index
    @title = "All Categories"
	@categories = Category.all
  end
  def show
    @category = Category.find(params[:id])
	@title = @category.name
	#redirect_to :action=>"show", :id=>params[:id]
  end

end
