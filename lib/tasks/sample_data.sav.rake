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
							 :user_id => 1)
							 
      end
    end	
	
	Ad.create!(:email => "example-1@railstutorial.org",
			   :user_id => 1,
			   :category_id => 1,
               :content => "4br fabulous fully furnished Belvedere Lagoon home short term rental.")
	Ad.create!(:email => "example-2@railstutorial.org",
			   :user_id => 2,
			   :category_id => 1,
               :content => "2br beautiful & sunny apartment in Haight Ashbury with large deck & garden.")
	Ad.create!(:email => "example-3@railstutorial.org",
			   :user_id => 1,
			   :category_id => 2,
               :content => "3br resort lifestyle in the heart of Tiburon!.")
	Ad.create!(:email => "example-4@railstutorial.org",
			   :user_id => 2,
			   :category_id => 2,
			   :post_id => 200000022,
               :content => "2br/2ba two level condo w/master suite & parking.")
	Ad.create!(:email => "example-5@railstutorial.org",
			   :user_id => 1,
			   :category_id => 3,
               :content => "$2500 large master badroom w/private bathrom & parking.")
	Ad.create!(:email => "example-6@railstutorial.org",
			   :user_id => 1,
			   :category_id => 3,
               :content => "$875 fernished room in upscale Victorian - 1 blk to UCLA.")
  end
end