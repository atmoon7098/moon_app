class AdsController < ApplicationController
   before_filter :authenticate, :only => [:create, :destroy]
   before_filter :authorized_user, :only => :destroy

  def create
    @catid = session[:return_to].split('/').last.to_i(10)
    #@user_ad  = current_user.ads.build(params[:user_ad])
	@ad  = Category.find_by_id(@catid).ads.build(params[:ad])
    if @ad.save
      flash[:success] = "Ad created!"
	  @ad.user_id = current_user.id	  
	  current_user.ads << @ad	  
      redirect_back
	  #redirect_to root_path
    else
      render 'mypages/home'
    end
  end

  def destroy
    #current_user.ads.destroy(params[:ad])
    @ad.destroy
    redirect_back_or root_path
  end
  
   private

    def authorized_user
      @ad = current_user.ads.find_by_id(params[:id])
      redirect_to root_path if @ad.nil?
    end
end

