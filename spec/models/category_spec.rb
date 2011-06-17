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
end
