require 'spec_helper'

describe "[Datetime Split] test" do
  before :all do
    @user = FactoryGirl.create(:user)
    @user.confirm_datetime_date = "2013-10-1"
    @user.confirm_datetime_time = "10:20"
  end

  context "Getter" do
    it "confirm_datetime should be 2013/10/1 10:20" do
      @user.confirm_datetime.to_date.should == Date.parse("2013/10/1 10:20")
    end

    it "confirm_datetime_date should be same after convert" do
      Date.parse(@user.confirm_datetime_date).should == Date.parse("2013/10/01")
    end

    it "confirm_datetime_date_time should be same after convert" do
      Time.parse(@user.confirm_datetime_time).should == Time.parse("10:20")
    end
  end

  context "time zero format" do
    it "should be 01:00" do
      @user.confirm_datetime_time = '01:00'
      @user.confirm_datetime_time.should  == '01:00'
    end
  end
end