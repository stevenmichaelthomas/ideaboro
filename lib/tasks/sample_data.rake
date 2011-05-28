

namespace :db do
require 'faker'
  desc "Fill database with sample data"
  task :populate => :environment do

    Rake::Task['db:reset'].invoke
    User.create!(:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
		end
		User.all(:limit => 6).each do |user|
          50.times do
        user.microposts.create!(:content => Faker::Lorem.sentence(5),
								:coreidea => "This is the core idea")
	  end
	  end
      Micropost.all(:limit => 6).each do |micropost|
          50.times do
        micropost.comments.create!(:comment => "Testing")
	  end
	end
  end
end