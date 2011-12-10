# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.fname                 "John"
  user.lname                 "Doe"
  user.email                 "jdoe@cs.utsa.edu"
  user.password              "john1"
  user.password_confirmation "john1"
end