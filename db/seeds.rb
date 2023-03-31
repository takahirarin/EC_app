# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 Admin.create!(
   email: 'aa@aa.com',
   password: 'aaaaaa',
 )

 genre = Genre.create!(
   name: 'とり'
   )

 Genre.create!(
   name: 'さかな'
   )

Item.create!(
  name: "セキセイインコ",
  price: 100,
  genre_id: genre.id,
  description: "鳥の一種です",
  image: File.open("./app/assets/images/inko.jpg")
  )


