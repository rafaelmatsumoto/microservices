# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
action = Genre.create({name: "Action"})

seventh_heaven = Movie.create({name: "7th heaven", release_date: "1927", genre_id: action.id, description: "7th heaven", image: "https://freeclassicimages.com/images/7th-Heaven-1927-1A3-movie-poster.jpg"})