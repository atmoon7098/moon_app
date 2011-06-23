class CategoriesController < ApplicationController

  #def index
  #  @title = "All Categories"
  #  @categories = Category.all
  #end
  
  def show
    @category = Category.find(params[:id])
	
	@ads = @category.ads.paginate(:page => params[:page], :per_page => 3)
	@title = @category.name
	store_location
	post_ad_of @category
	if signed_in?
	  @ad = Ad.new 
	end
  end
  
end
