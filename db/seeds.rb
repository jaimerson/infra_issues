# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.find_by(email: 'admin@example.org')
user ||= User.create(email: 'admin@example.org', password: 'password', confirmed_at: Time.now, role: :admin)

(101..110).each do |n|
  location = Location.find_by(name: "A#{n}")
  location ||= Location.create(name: "A#{n}", floor: :first)
  location = Location.find_by(name: "B#{n}")
  location ||= Location.create(name: "B#{n}", floor: :first)
end

(201..210).each do |n|
  location = Location.find_by(name: "A#{n}")
  location ||= Location.create(name: "A#{n}", floor: :second)
  location = Location.find_by(name: "B#{n}")
  location ||= Location.create(name: "B#{n}", floor: :second)
end

(301..310).each do |n|
  location = Location.find_by(name: "A#{n}")
  location ||= Location.create(name: "A#{n}", floor: :third)
  location = Location.find_by(name: "B#{n}")
  location ||= Location.create(name: "B#{n}", floor: :third)
end

(401..410).each do |n|
  location = Location.find_by(name: "A#{n}")
  location ||= Location.create(name: "A#{n}", floor: :fourth)
  location = Location.find_by(name: "B#{n}")
  location ||= Location.create(name: "B#{n}", floor: :fourth)
end

location = Location.find_by(name: "Estacionamento")
location ||= Location.create(name: "Estacionamento", floor: :outside)
