# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  )
end

users = User.all

50.times do
  Wiki.create!(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.paragraph,
  user: users.sample,
  private: false
  )
end

User.create!(
  email: 'admin@admin.com',
  password: 'helloworld',
  role: 'admin',
)

User.create!(
  email: 'standard@standard.com',
  password: 'hello_world',
  role: 'standard'
)

User.create!(
  email: 'premium@premium.com',
  password: 'password',
  role: 'premium',
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
