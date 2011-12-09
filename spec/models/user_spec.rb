require 'spec_helper'

describe User do
  before (:each) do
    @attr = {:fname => "John", :lname => "Doe",  :email => "jdoe@example.com"}
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  it "should require a first name" do
    no_fname_user = User.new(@attr.merge(:fname => ""))
    no_fname_user.should_not be_valid
  end
  
  it "should reject first names that are too long" do
    long_fname = "a"*26
    long_fname_user = User.new(@attr.merge(:fname => long_fname))
    long_fname_user.should_not be_valid
  end
    
  it "should require a last name" do
    no_lname_user = User.new(@attr.merge(:lname => ""))
    no_lname_user.should_not be_valid
  end

  it "should reject last names that are too long" do
    long_lname = "a"*26
    long_lname_user = User.new(@attr.merge(:lname => long_lname))
    long_lname_user.should_not be_valid
  end
  
  it "should require an email" do
    no_email_user = User.new(@attr.merge(:email => ""))
    no_email_user.should_not be_valid
  end
    
  it "should accept email addresses that are valid"  do
    valid_addresses = %w[user@foo.com user@foo.blech.org example.user@foo.com]
    valid_addresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      valid_email_user.should be_valid
    end
  end
 
  it "should reject email addresses that are invalid" do
    invalid_addresses = %w[user@foo,com user_at_foo.org example@foo. @foo.com]
    invalid_addresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      invalid_email_user.should_not be_valid
    end
  end
    
  it "should reject duplicate email addresses" do
    user1 = User.create!(@attr)
    user1.should be_valid
    user2 = User.new(@attr)
    upperCaseEmail = @attr[:email].upcase
    user3 = User.new(@attr.merge(:email => upperCaseEmail))
  end
end