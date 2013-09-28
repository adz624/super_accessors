require 'spec_helper'

describe "Data types" do
  #pending User.reload
  User.new
  before :all do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:admin)
  end
  context "[1] create test data for value test" do
    it "Available should be false" do
      @user.available.should == false
    end
    it "Admin should be false" do
      @user.admin.should == false
    end
    it "Manager should be false" do
      @user.manager.should == false
    end
    it "Teacher should be false" do
      @user.teacher.should == false
    end
    it "Worker should be true" do
      @user.worker.should == true
    end
  end

  context "[2] create test data for value test" do
    it "Available should be false" do
      @user2.available.should == false
    end
    it "Admin should be true" do
      @user2.admin.should == true
    end
    it "Manager should be false" do
      @user2.manager.should == false
    end
    it "Teacher should be true" do
      @user2.teacher.should == true
    end
    it "Worker should be false" do
      @user2.worker.should == false
    end
  end
end