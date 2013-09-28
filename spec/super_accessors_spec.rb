require 'spec_helper'


class User < ActiveRecord::Base
  store_define :contact_info, accessors: {name: :s, zipcode: :i, mobile: :s, available: :b}
  store_define :roles, accessors: {admin: :b, manager: :b, teacher: :b, worker: :b}, checkboxes: true
end

describe SuperAccessors do
  before do
    @user = User.new
    # contact_info
    @user.name = 'Eddie Li'
    @user.zipcode = '83045'
    @user.mobile = 12345678
    @user.available = 'true'
    # roles
    @user.admin = true
    @user.manager = false
    @user.teacher = true
    @user.woker = false
  end
  context "[Store] data types" do
    it "name" do
      @user.name.class.should == String
    end
    it "zipcode" do
      @user.zipcode.class.should == Fixnum
    end
    it "mobile" do
      @user.mobile.class.should == String
    end
    it "available" do
      @user.available.class.should == TrueClass
    end
  end

  context "[Checkboxes] data types" do
    it "admin"

    end
  end
end