class MypagesController < ApplicationController
  def home
    @title = "Home"
	@categories = Category.find(:all)
	
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

end
