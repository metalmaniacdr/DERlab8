class User < ActiveRecord::Base
  attr_accessible :fname, :lname, :email
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :fname, :presence => true,
                    :length   => { :maximum => 25 }
  validates :lname, :presence => true,
                    :length   => { :maximum => 25 }
  validates :email, :presence => true,
                    :format   => { :with => email_regex },
                    :uniqueness => {:case_sensitive => false}
end
