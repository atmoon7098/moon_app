class UsersController < ApplicationController
  def new
    @title = "Registration"
	@user = User.new
  end
  def show
    @user = User.find(params[:id])
	@title = @user.name
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
