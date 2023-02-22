# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
Booking.destroy_all
Course.destroy_all
User.destroy_all

25.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    speciality: Faker::Food.ethnic_category,
    email: Faker::Internet.email,
    password: "123123"
  )
end

courses = [
  {
    category: "Japanese",
    image: "japanese_food.jpg"
  },
  {
    category: "Italian",
    image: "italian_food.jpg"
  },
  {
    category: "Thai",
    image: "Thai_food.jpg"
  },
  {
    category: "French",
    image: "french_food.jpg"
  },
  {
    category: "Vietnamese",
    image: "Vietnamese_food.jpg"
  },
  {
    category: "Taiwanese",
    image: "Taiwanese_food.jpg"
  },
]

courses.each do |course|
  new_course = Course.new(
    category: course[:category],
    price: rand(5000..15_000),
    name: course[:category],
    user: User.all.sample
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
