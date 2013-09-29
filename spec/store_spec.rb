require 'spec_helper'

describe "[Store] test" do
  before :all do
    @user = FactoryGirl.create(:user)
    @admin = FactoryGirl.create(:admin)
  end

  context "data types test" do
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

  context "value test [1]" do
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

  context "value test [2]" do
    it "Available should be false" do
      @admin.available.should == false
    end
    it "Admin should be true" do
      @admin.admin.should == true
    end
    it "Manager should be false" do
      @admin.manager.should == false
    end
    it "Teacher should be true" do
      @admin.teacher.should == true
    end
    it "Worker should be false" do
      @admin.worker.should == false
    end
  end

  context "checkboxes test" do
    it "roles key list should be [worker]" do
      @user.roles_keys.should == [:worker]
    end
    it "roles options should be [Worker]" do
      @user.roles_options.should == ["Worker"]
    end
    it "roles keys should be [:admin, :teacher]" do
      @admin.roles_keys.should == [:admin, :teacher]
    end
    it "roles options should be [:admin, :teacher]" do
      @admin.roles_options.should == ["Admin", "Teacher"]
    end
  end
end