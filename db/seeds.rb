# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Make sure to clear old data out of your db when you run rails db:seed
# Reviews will also be deleted since Product.destroy_all will run our
# 'dependent: :destroy' callback.
Product.destroy_all

# Now go ahead and create new data
1000.times do
  p = Product.create({
    title: Faker::Hacker.noun,
    description: Faker::Hacker.say_something_smart,
    price: Faker::Commerce.price
  })

  if p.valid?
    rand(0..10).times.each do
      Review.create(
        rating: Faker::Number.between(1, 5),
        body: Faker::Seinfeld.quote,
        product: p
      )
    end
  end
end

# It's nice to print object counts to make sure it created what you expected.
puts "Created #{Product.count} products"
puts "Created #{Review.count} reviews"
