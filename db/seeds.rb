# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
include BCrypt

puts "Resetting All Datafields"

Interest.destroy_all
User.destroy_all

puts "creating Users"

pass1 = Password.create("asdf")
pass2 = Password.create("123")

user1 = User.create({name: "Fang", 
	username: "fanzhong", 
	password_digest:pass1, 
	email:"fz@gmail.com", 
	profile_pic:"https://i.ya-webdesign.com/images/megumin-cute-png-14.png"})

user2 = User.create({name: "Frank", 
	username: "frank1", 
	password_digest:pass2, 
	email:"frank@gmail.com", 
	profile_pic:"https://vignette.wikia.nocookie.net/leagueoflegends/images/4/4c/Kog%27Maw_Render.png/revision/latest?cb=20181118184143"})

user3 = User.create({name: "Dom", 
	username: "dom", 
	password_digest:pass1, 
	email:"dom@yahoo.com"})

puts "creating Interests"

Interest.create({user: user1, interest: "League of Legends"})
Interest.create({user: user1, interest: "Monster Hunter"})
Interest.create({user: user1, interest: "Food"})

Interest.create({user: user2, interest: "League of Legends"})
Interest.create({user: user2, interest: "Auth"})

Interest.create({user: user3, interest: "Do Your work"})

puts "Finished Seeding"