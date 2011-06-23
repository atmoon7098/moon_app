class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                           params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user 
	  # comment out the following line
	  # make it back to the selected category page 06/22/2011
	  #redirect_to user
	  redirect_back
    end
	
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
