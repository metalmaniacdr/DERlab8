namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
   
    admin = User.create!(:first_name => "Dexter",
                         :last_name => "Rivas",
                         :email => "drivas@cs.utsa.edu",
                         :password => "1a2b3c4d",
                         :password_confirmation => "1a2b3c4d")
    admin.toggle!(:admin)
   
    User.create!(:first_name => "John",
                 :last_name => "Doe",
                 :email => "jdoe@cs.utsa.edu",
                 :password => "john1",
                 :password_confirmation => "john1")
    98.times do |n|
      first_name  = Faker::Name.first_name
      last_name  = Faker::Name.last_name
      email = "example-#{n+1}@cs.utsa.edu"
      password  = "password"
      User.create!(:first_name => first_name,
                   :last_name => last_name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end