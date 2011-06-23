require 'spec_helper'

describe Category do
  before(:each) do
    @attr = { :name => "Example Category" }
  end

  it "should create a new instance given valid attributes" do
    Category.create!(@attr)
  end

  it "should require a name" do
    no_name_category = Category.new(@attr.merge(:name => ""))
    no_name_category.should_not be_valid
  end
  
  describe "ad associations" do

    before(:each) do
      @category = Category.create(@attr)
	  @ad1 = Factory(:ad, :category => @category, :created_at => 1.day.ago)
      @ad2 = Factory(:ad, :category => @category, :created_at => 1.hour.ago)
    end

    it "should have a ads attribute" do
      @category.should respond_to(:ads)
    end
	
	it "should have the right ads in the right order" do
      @category.ads.should == [@ad2, @ad1]
    end
	
	it "should destroy associated ads" do
      @category.destroy
      [@ad1, @ad2].each do |ad|
        Ad.find_by_id(ad.id).should be_nil
      end
    end
  end
end
