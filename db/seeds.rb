# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Language.create(language:"English")
Language.create(language:"French")
Language.create(language:"Spanish")

Role.create(name: "admin")
Role.create(name: "user")


User.create(first_name: "God", last_name: "Dog", email: "god@gmail.com", location: "NYC", nationality: "American", bio: "Hello", password: "password", avatar: "/assets/images/profile/beyonce.jpeg" admin: true, approved: true, role_id: 1)

