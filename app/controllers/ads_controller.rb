class AdsController < ApplicationController
   before_filter :authenticate, :only => [:create, :destroy]

  def create
    #@ad  = current_user.ads.build(params[:ad])
	@ad  = Category.find_by_id(2).ads.build(params[:ad])
    if @ad.save
      flash[:success] = "Ad created!"
      redirect_back
	  #redirect_to root_path
    else
      render 'mypages/home'
    end
  end

  def destroy
  end
end

