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
picture = {
  "Japanese" => [
    ["https://res.cloudinary.com/dh7mp7shk/image/upload/v1676962721/japanese_food_tvtw0z.jpg"],
    ["Japanese"]
    ],
  "Italian" => [
    ["https://res.cloudinary.com/dh7mp7shk/image/upload/v1676962721/italian_food_ztqydo.jpg"],
    ["italian"]
    ],
    "Thai" => [
    ["https://res.cloudinary.com/dh7mp7shk/image/upload/v1676963203/Thai_food_gjsygs.jpg"],
    ["Thai"]
    ],
    "French" => [
    ["https://res.cloudinary.com/dh7mp7shk/image/upload/v1676962721/french_food_naebnt.jpg"],
    ["French"]
    ],
    "Vietnamese" => [
    ["https://res.cloudinary.com/dh7mp7shk/image/upload/v1676963203/Vietnamese_food_vp5wtt.jpg"],
    ["Vietnamese"]
    ],
    "Taiwanese" => [
    ["https://res.cloudinary.com/dh7mp7shk/image/upload/v1676963203/Taiwanese_food_vrz5ei.jpg"],
    ["Taiwanese"]
    ],
}

picture.each do |category, info|
  course = Course.new(
    category:,
    price: rand(5000..15_000),
    name: info[1].sample,
    user: User.all.sample
  )
  file = URI.open(info[0].sample)
  course.photo.attach(io: file, filename: "#{course.name}.jpg")
  course.save
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
