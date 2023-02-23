# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'yaml'
require 'open-uri'
require 'faker'
Booking.destroy_all
Course.destroy_all
User.destroy_all

addresses_url = 'https://gist.githubusercontent.com/trouni/599e03440e2552e803c54c62916f874c/raw/cc7aff8deeb27c3f22ee501b6723766a8cb68f2b/addresses.yml'
serialized_addresses = URI.open(addresses_url).read
addresses = YAML.load(serialized_addresses)

25.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: addresses.sample.split(",")[-2..-1].join(", "),
    speciality: Faker::Food.ethnic_category,
    email: Faker::Internet.email,
    password: "123123"
  )
end

courses = [
  {
    category: "Japanese",
    image: "japanese_food.jpg",
    description:"The traditional cuisine of Japan is based on rice with miso soup and other dishes; there is an emphasis on seasonal ingredients. Side dishes often consist of fish, pickled vegetables, and vegetables cooked in broth. Seafood is common, often grilled, but also served raw as sashimi or in sushi."
  },
  {
    category: "Italian",
    image: "italian_food.jpg",
    description:"The Mediterranean diet forms the basis of Italian cuisine, rich in pasta, fish, fruits and vegetables. Cheese, cold cuts and wine are central to Italian cuisine, and along with pizza and coffee (especially espresso) form part of Italian gastronomic culture. "
  },
  {
    category: "Thai",
    image: "Thai_food.jpg",
    description:"Thai cuisine is a simple yet clever combination of Eastern and Western influences harmoniously combined. There are many dishes with thick noodles, vegetables, lettuce, and chicken, lamb, shrimp, or beef. Some dishes are more rice geared or contain fruits such as pineapple or papaya. Sour, sweet, salty, bitter and spicy flavors work together to make each dish come alive.  "
  },
  {
    category: "French",
    image: "french_food.jpg",
    description:"French cuisine rely heavily on local products. Fresh apples, berries, leeks, mushrooms, various squash, and stone fruits are among the most commonly used products. Poultry, beef, lamb, and veal are readily available year-round. Game meat is especially popular and abundant during the hunting season that runs from early autumn to February. No matter the region, France has an abundance of artisanal cheese and wine. "
  },
  {
    category: "Vietnamese",
    image: "Vietnamese_food.jpg",
    description:"Vietnamese cuisine is known for using fish sauce, soy sauce, rice, fresh fruits and vegetables and herbs and spices including lemon grass, lime and kaffir lime leaves. Throughout all regions of Vietnam, the emphasis is always on serving fresh vegetables and herbs as side dishes along with dipping sauce."
  },
  {
    category: "Taiwanese",
    image: "Taiwanese_food.jpg",
    description:"Taiwanese cuisine features bold flavors and unique textures, drawing inspiration from various Chinese regional cuisines as well as Japanese and Southeast Asian influences. Popular dishes include beef noodle soup, oyster omelette, and stinky tofu."
  },
]

courses.each do |course|
  new_course = Course.new(
    category: course[:category],
    price: rand(5000..15_000),
    name: course[:category],
    user: User.all.sample,
    description: course[:description]
  )
  file = File.open("app/assets/images/#{course[:image]}")
  new_course.photo.attach(io: file, filename: "#{new_course.name}.jpg")
  new_course.save!
end

# 10.times do
#   course = Course.create(
#     category: Faker::Food.ethnic_category,
#     price: rand(5000..15_000),
#     name: Faker::Food.dish,
#     user: User.all.sample
#   )
# picture
#   file = URI.open("https://source.unsplash.com/featured?#{course.name}")
#   course.photo.attach(io: file, filename: "#{course.name}.jpg")
#   course.save
# end

25.times do
  Booking.create(
    start_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    end_time: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    status: ["pending", "accepted", "rejected"].sample,
    course: Course.all.sample,
    user: User.all.sample
  )
end

# 25.times do
#   Review.create(
#     rating: rand(0..5),
#     comments: Faker::Lorem.sentence
#   )
# end
