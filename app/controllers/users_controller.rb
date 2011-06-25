class UsersController < ApplicationController
  def new
    @title = "Registration"
	@user = User.new
  end
  def show
    @user = User.find(params[:id])
	@title = @user.name
	if signed_in?
      #@feed_items = current_user.feed.paginate(:page => params[:page], :per_page => 3)
	  @ads = current_user.ads.paginate(:page => params[:page], :per_page => 3)
    end
  end
  def create
    @user = User.new(params[:user])
    if @user.save
	  sign_in @user
	  flash[:success] = "Welcome to Tagsmoon's List!"
      redirect_to @user
    else
      @title = "Registration"
      render 'new'
    end
  end
end
