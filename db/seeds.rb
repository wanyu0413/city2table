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
  {
    category: "Korean",
    image: "korean_food.jpg",
    description:"Korean cuisine stands out from other cuisines with the many side dishes (banchan) that are served during meals. The number of side dishes can range anywhere from 2 to 12, but everyday meals feature at least a few. When you eat at a Korean restaurant, your various side dishes will come to you before your meal in small bowls and can be anything from vegetables to meat to seafood prepared in any number of ways. Korean dishes are all served at the same time, so there are no separate courses like in Western cuisines."
  },
  {
    category: "Indian",
    image: "indian_food.jpg",
    description:"The staple Indian foods are Rice, Wheat and Lentils. And no Indian dish is complete without spices. Indian food is a combination of all six tastes like sweet, sour, salty, bitter, spicy and astringent. In India different dishes are prepared for different festivals. Every festival tends to be complete only when special food associated with that festival is cooked on that day."
  },
  {
    category: "German",
    image: "german_food.jpg",
    description:"German cuisine focus heavily on bread, potatoes, and meat, especially pork, as well as plenty of greens such as types of cabbage and kale. Cake, coffee, and beer are all highly popular elements of German cuisine too. Germans love their meats, especially roasts. Some of the most common traditional meat dishes include roasted pork hocks (Schweinshaxe), braised pork roast with cabbage (Schweinebraten und Kohl), and Sauerbraten. Another well-known traditional dish is schnitzel, a German way of preparing meat, usually cutlets."
  },
  {
    category: "Spanish",
    image: "spanish_food.jpg",
    description:"Spanish cuisine reflects the principles of the Mediterranean diet, including lots of fresh fruits and vegetables, olive oil, nuts, seafood, and—of course—wine. Locally. It forms the base of many vegetable sauces (known in Spanish as sofritos).Herbs most commonly used include parsley, oregano, rosemary and thyme. The use of garlic has been noted as common in Spanish cooking. The most used meats in Spanish cuisine include chicken, pork, lamb and veal. Fish and seafood are also consumed on a regular basis. Tapas are snacks and appetizers commonly served with drinks in bars and cafes."
  },
  {
    category: "Chinese",
    image: "chinese_food.jpg",
    description:"Chinese cuisine, rich and colorful, has diversified color, aromatic flavor, and excellent taste as its main features. With these three characteristics, it is not only tasty but also a work of art for people to appreciate.A typical Chinese meal will have two things - a carbohydrate or starch like noodles, rice or buns, and accompanying stir fries or dishes of veggies, fish and meat. They use a lot of fresh vegetables like mushroom, water chestnuts, bamboo and even tofu."
  },
  {
    category: "Mexican",
    image: "mexican_food.jpg",
    description:"One of the world’s great cuisines, Mexican food is diverse, delicious, and profoundly omnivorous, both simple and sophisticated. Typical Mexican dishes are as basic as the ubiquitous quesadilla (a warm tortilla filled with melted cheese) or as elaborate as chicken served in mole negro (a Oaxacan sauce prepared with dozens of hand-ground ingredients). Food is essential to Mexican culture, and eating well is something enjoyed throughout Mexico, at every price point and in every type of establishment—from food stalls, bakeries, and markets to cafés, cantinas, and restaurants."
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
  new_course.photos.attach(io: file, filename: "#{new_course.name}.jpg")
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
