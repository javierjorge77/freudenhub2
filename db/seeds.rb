# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1= User.new(name:"J. Jorge", lastname: "Perez Ontiveros", plant:"Cuautla", department: "Operations", position:"PP Manager", email: "javierjorge77@gmail.com", password: "123456", admin: true)
user1.save!

user2= User.new(name:"Jorge", lastname: "Perez Ontiveros", plant:"Cuautla", department: "Operations", position:"PP Manager", email: "javo_7_7@hotmail.com", password: "123456", admin: false )
user2.save!

tool1= Tool.new(user: user1, alias:"hur5415-test", sap:"71500288", layout:"shorturl.at/chknx", plant:"Cuautla", bu:"damper", technology: "panstone", customer:"Tenneco", volume: 500000, max: 42, damaged: 1, blocked: 1, active: 40, spares: 0, segment: "MV",  available: 0.95)
tool1.save!

tool2= Tool.new(user: user1, alias:"hur5414-test", sap:"71500287", layout:"shorturl.at/chknx", plant:"Cuautla", bu:"damper", technology: "panstone", customer:"Tenneco", volume: 300000, max: 42, damaged: 0, blocked: 0, active: 42, spares: 5, segment: "MV",  available: 1.0)
tool2.save!



tool4= Tool.new(user: User.first, alias:"hur5414-prueba", sap:"71500285", layout:"shorturl.at/chknx", plant:"Spain", bu:"damper", technology: "panstone", customer:"Tenneco", volume: 600000, max: 42, damaged: 0, blocked: 0, active: 42, spares: 5, segment: "HV",  available: 1.0)
tool4.save!
