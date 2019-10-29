# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "Cameron Scott",
    email: "camscottgreen@hotmail.com",
    password: "foobar",
    password_confirmation: "foobar")

50.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password)
end

sample = User.order(:created_at).take(6)
10.times do
  content = Faker::Lorem.sentence(5)
  sample.each { |user| user.posts.create!(body: content) }
end

users = User.all
user = users.first
requests = users[2..25]
friends = users[2..20]
requests.each { |requester| requester.request_friend(user) }
friends.each { |friend| user.request_friend(friend) }