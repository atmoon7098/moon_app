require 'spec_helper'

describe CategoriesController do
  render_views
  
  describe "GET 'show'" do
    before(:each) do
	  @category = factory(:category)
	end 
		
    it "should be successful" do
      get 'show'
      response.should be_success
    end
	
	it "should show the category's ads" do
      ad1 = Factory(:ad, :category => @category, :content => "Foo bar", :email => "user1@example.org")
      ad2 = Factory(:ad, :category => @category, :content => "Baz quux", :email => "user2@example.org")
      get :show, :id => @category
      response.should have_selector("span.content", :content => ad1.content)
	  response.should have_selector("span.email", :email => ad1.email)
      response.should have_selector("span.content", :content => ad2.content)
	  response.should have_selector("span.email", :email => ad2.email)
    end
  end

end
