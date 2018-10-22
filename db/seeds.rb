# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Make sure to clear old data out of your db when you run rails db:seed
# Reviews will also be deleted if we use Product.destroy_all as it will run our
# 'dependent: :destroy' callback.
# Now we'll use delete_all and just include all
# objects that need deleting.
Review.delete_all
Product.delete_all
User.delete_all

PASSWORD = "supersecret"
NUM_OF_USERS = 20
NUM_OF_PRODUCTS = 100

super_user = User.create(
  first_name: "Jon",
  last_name: "Snow",
  email: "js@winterfell.gov",
  password: PASSWORD,
  admin: true
)

NUM_OF_USERS.times do |num|
  full_name = Faker::SiliconValley.character.split(' ')
  first_name = full_name[0]
  last_name = full_name[1]
  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}.#{last_name}-#{num}@piedpiper.com",
    password: 'supersecret'
  )
end

users = User.all
# Now go ahead and create new data
NUM_OF_PRODUCTS.times do
  p = Product.create({
    title: Faker::Hacker.noun,
    description: Faker::Hacker.say_something_smart,
    price: Faker::Commerce.price,
    user: users.sample
  })

  if p.valid?
    rand(0..10).times.each do
      Review.create(
        rating: Faker::Number.between(1, 5),
        body: Faker::Seinfeld.quote,
        product: p,
        user: users.sample
      )
    end
  end
end

# It's nice to print object counts to make sure it created what you expected.
puts "Created #{User.count} users"
puts "Created #{Product.count} products"
puts "Created #{Review.count} reviews"
puts "Login as admin with #{super_user.email} and password of '#{PASSWORD}'!"
