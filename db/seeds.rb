# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Attendance.destroy_all
Event.destroy_all
User.destroy_all

10.times do

		first_name = Faker::Name.first_name
		User.create!(first_name: first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph, email: first_name + "@yopmail.com", password: "azerty")
end

puts "10 users ont été crée."


10.times do 

	e =	Event.create!(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, location: Faker::Address.city, start_date: Faker::Date.forward(days: 1200), duration: rand(1..7), price: rand(1..300))
	Attendance.create(user: User.all.sample, event: e)

end






puts "Génération terminée."
