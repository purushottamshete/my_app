# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
User.create(fname: "Umesh", lname: "Shete", email: "umesh@gmail.com", have_a_car: true)
City.create(name: "Pune", country_id: 1)
City.create(name: "Mumbai", country_id: 1)
City.create(name: "Nashik", country_id: 1)
