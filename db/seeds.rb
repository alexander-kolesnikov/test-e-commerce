# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# 10 categories
p "10 categories"
10.times do |i|
  @category = Category.create!(title: Faker::Commerce.color + '_' + i.to_s)
end

# 150 products
150.times do |i|
  @random_category=Category.order('RANDOM()').first
  @product = Product.create!(title: Faker::Commerce.product_name, description: Faker::Lorem.paragraph(10, false, 4), category: @random_category, price: Faker::Commerce.price, stock_level: rand(150)+1, image: open(Faker::Avatar.image rand(1000).to_s))
  p @product
end