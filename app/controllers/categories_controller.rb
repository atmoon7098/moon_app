class CategoriesController < ApplicationController

  #def index
  #  @title = "All Categories"
  #  @categories = Category.all
  #end
  
  def show
    @category = Category.find(params[:id])
	#@user_ads = current_user.ads.paginate(:page => params[:page], :per_page => 3)
	@ads = @category.ads.paginate(:page => params[:page], :per_page => 3)
	@title = @category.name
	store_location

	if signed_in?
	  @ad = Ad.new 
	end
  end
  
end
