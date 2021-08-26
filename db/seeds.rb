# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all

Category.create(id: 1, title: "Men's Fashion")
Category.create(id: 2, title: "Home and Kitchen")
Category.create(id: 3, title: "Electronics")
Category.create(id: 4, title: "computres")
Category.create(id: 5, title: "Arts & Crafts")
Category.create(id: 6, title: "Girl's Fashion")
Category.create(id: 7, title: "pets")
Category.create(id: 8, title: "Tools & Home improvement")
Category.create(id: 9, title: "Toys & Games")
Category.create(id: 10, title: "sports & outdoors")
Category.create(id: 11, title: "Health & Household")
Category.create(id: 12, title: "Gifts")
Category.create(id: 13, title: "smart Home")
Category.create(id: 14, title: "Beauty and personal care")
Category.create(id: 15, title: "industrial and scientific")
Category.create(id: 16, title: "Books")