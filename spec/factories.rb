# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Gordon Moon"
  user.email                 "gmoon@sidewayslogic.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end
# By using the symbol ':category', we get Factory Girl to simulate the Category model.
Factory.define :category do |category|
  category.name              "Homes for rent"
end
# Added 5/31/2011 for testing pagination
Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

# Added 6/21/2011 for testing ads
Factory.define :ad do |ad|
  ad.description "Foo bar"
  ad.email "user@example.com"
  ad.association :category
end