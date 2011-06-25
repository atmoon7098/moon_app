class AdsController < ApplicationController
   before_filter :authenticate, :only => [:create, :edit, :update, :destroy]
   before_filter :authorized_user, :only => [:destroy, :edit, :update]

  def create
    @catid = session[:return_to].split('/').last.to_i(10)
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
  
  def edit
    @ad = current_user.ads.find_by_id(params[:id])
    #@title = "Edit Ad"
  end
  def update
    @ad = current_user.ads.find_by_id(params[:id])
    if @ad.update_attributes(params[:ad])
      flash[:success] = "Ad updated."
      redirect_to current_user
    else
      @title = "Edit Ad"
      render 'edit'
    end
  end
  def show
    @ad = current_user.ads.find_by_id(params[:id])
	@title = "Edit Ad"
  end
  
  def destroy
    current_user.ads.find_by_id(params[:id]).destroy
    flash[:success] = "Ad deleted."
    #redirect_back_or root_path
	redirect_to current_user
  end
  
   private

    def authorized_user
      @ad = current_user.ads.find_by_id(params[:id])
	rescue
      #redirect_to root_path if @ad.nil?
	  redirect_to root_path
    end
end

