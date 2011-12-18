require 'spec_helper'

describe Appointment do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
    @user = Factory(:user)
    @attr = {
      :year     =>  2011
      :make     =>  "Honda"
      :model    =>  "Civic"
      :mileage  =>  25000
      :date     =>  "12/16/2011" 
      :time     =>  "4:00pm"
      :user_id  =>  1
         
    }
  end

  it "should create a new instance given valid attributes" do
    @user.appointment.create!(@attr)
    end
  end
  
  describe "user associations" do

    before(:each) do
      @appointment = @user.appointment.create(@attr)
    end

    it "should have a user attribute" do
      @appointment.should respond_to(:user)
    end

    it "should have the right associated user" do
      @appointment.user_id.should == @user.id
      @appointment.user.should == @user
    end
  end
  
  
  
  
  
  
  
  
end
