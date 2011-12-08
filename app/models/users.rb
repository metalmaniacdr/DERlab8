class Users < ActiveRecord::Base
  attr_accessible :fname, :lname, :email
  
  validates :name, :presence => true
end
