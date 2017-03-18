# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |t|
    c = Film.new
    c.title = Faker::Book.title
    c.director = Faker::Name.name_with_middle
    c.year = Faker::Number.between(1930, 2017)
    c.poster = Faker::LoremPixel.image("256x256")
    c.save
end
