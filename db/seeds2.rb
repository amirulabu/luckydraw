require 'csv'    


CSV.foreach("db/seed.csv") do |row|
	print row[0] + " - - " +  row[1] + "\n"
	Person.create(name: "#{row[0]}", petid: "#{row[1]}")

end