namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
	Rake::Task['db:reset'].invoke
    User.create!(:name => "Tiffany Moon",
                 :email => "tiffany@tagsmoon.com",
                 :password => "foobar",
                 :password_confirmation => "foobar")
	
    News.create!(:title => "New category created!",
	             :date => "06/19/2011 14:20:00",
                 :article => "Category 'Short Fat Fashion' facilitates users to advertise Clothing & Accessories for female with height under 5'4(163 cm)")
				 
	Category.create!(:name => "vacation rentals")
    Category.create!(:name => "homes for sail") 
    Category.create!(:name => "homes for rent")	
	
	Category.all.each do |item|
      5.times do |n|
	    email = "example-#{n+1}@railstutorial.org"
        item.ads.create!(:content => Faker::Lorem.sentence(5),
		                     :email => email,
							 :user_id => 1,
							 :post_id => id+(10000000*item.id))
      end
    end	
  end
end