# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.first_name            "John"
  user.last_name             "Doe"
  user.email                 "jdoe@cs.utsa.edu"
  user.password              "john1"
  user.password_confirmation "john1"
end

Factory.define :appointment do |appointment|
  appointment.year     =>  2011
  appointment.make     =>  "Honda"
  appointment.model    =>  "Civic"
  appointment.mileage  =>  25000
  appointment.date     =>  "12/16/2011" 
  appointment.time     =>  "4:00pm"
  appointment.association :user
end
