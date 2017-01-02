# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Person.destroy_all
Winner.destroy_all

# 50.times do |i|
# 	Person.create(name: "Person##{i}", petid: "00#{(i+1)*123}")
# end

# p "Done #{Person.count} seeds"


require 'csv'    

puts "start read csv"
CSV.foreach("db/seed.csv") do |row|
	print "."
	Person.create(name: "#{row[0]}", petid: "#{row[1]}")

end
puts "end read csv"
puts "Dont forget to create user(admin,super admin)!"


puts "Total person: "  + "#{Person.count}"
puts "Total user: " + "#{User.count}"
puts "Total winner: " + "#{Winner.count}"
