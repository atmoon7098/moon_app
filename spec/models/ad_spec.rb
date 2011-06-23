require 'spec_helper'

describe Ad do
   before(:each) do
    @category = Factory(:category)
    @attr = {
      :content => "value for content",
      :email => "user@example.com",
    }
  end

  it "should create a new instance given valid attributes" do
    @category.ads.create!(@attr)
  end
  
  describe "category associations" do

    before(:each) do
      @ad = @category.ads.create(@attr)
    end

    it "should have a category attribute" do
      @ad.should respond_to(:category)
    end

    it "should have the right associated category" do
      @ad.category_id.should == @category.id
      @ad.category.should == @category
    end
  end
  
   describe "validations" do
    it "should require a category id" do
      Ad.new(@attr).should_not be_valid
    end
    it "should require nonblank content" do
      @category.ads.build(:content => "  ").should_not be_valid
    end
    it "should require nonblank email" do
      @category.ads.build(:email => "  ").should_not be_valid
    end
   end
end
