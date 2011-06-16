require 'spec_helper'

describe MypagesController do
  render_views

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
	it "should have the right title" do
      get 'home'
      response.should have_selector("title",
                        :content => 
						  "Ruby on Rails Termproj Moon App | Home")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end
	it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
                        :content => 
						  "Ruby on Rails Termproj Moon App | Contact")
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
	it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                        :content =>
                          "Ruby on Rails Termproj Moon App | About")
    end
  end
end
