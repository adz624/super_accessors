require 'spec_helper'

describe "Data types" do
  #pending User.reload
  User.new
  before :all do
    @user = FactoryGirl.create(:user)
  end
  context "create test data for data types test" do
    it "Name should be String" do
      @user.name.class.should == String
    end
    it "Zipcode should be Fixnum" do
      @user.zipcode.class.should == Fixnum
    end
    it "Mobile should be String" do
      @user.mobile.class.should == String
    end
    it "Available should be boolean" do
      @user.available.class.should == FalseClass || @user.available.class.should == TrueClass
    end
  end
end