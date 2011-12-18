class Appointment < ActiveRecord::Base
  attr_accessible :year, :make, :model, :mileage, :date, :time
  belongs_to :user
  
  date_regex = /^(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])\/(19|20)\d\d$/ #dd/mm/yyyy
  
  time_regex = /^(1[0-2]|[1-9]):[0-5][0-9](am|pm|AM|PM)$/ #hh:mmam


  validates :year, :presence => true,
                   :length   => { :within => 4..4 }
  validates :make, :presence => true,
                   :length   => { :maximum => 15 }
  validates :model,:presence => true,
                   :length   => { :maximum => 15 }
  validates :mileage, :presence => true,
                      :length   => { :maximum => 7 }
  validates :date, :presence => true,
                   :format   => { :with => date_regex },
                   :length   => { :within => 10..10 }
  validates :time, :presence => true,
                   :format   => { :with => time_regex },
                   :length   => { :maximum => 8 }
  
  default_scope :order => 'appointments.created_at ASC'
end
