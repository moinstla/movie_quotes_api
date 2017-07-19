# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# class Seed
#
#   def self.begin
#     seed = Seed.new
#     seed.generate_movies
#   end
#
#   def generate_movies
#     30.times do |i|
#       movie = Movie.create!(
#       title: Faker::Book.title,
#       genre: Faker::HowIMetYourMother.high_five
#       )
#
#       3.times do |i|
#         movie.quotes.create(character: Faker::Hipster.sentence(2),
#         content: Faker::TheFreshPrinceOfBelAir.quote)
#       end
#     end
#   end
# end
#
# Seed.begin

Movie.destroy_all
Quote.destroy_all

25.times do |index|
  movie = Movie.create!(title: Faker::Book.title, genre: Faker::HowIMetYourMother.high_five)
  n = Faker::Number.between(1, 5)
    n.times do |index|
      movie.quotes.create!(character: Faker::Hipster.sentence(2, false, 0), content: Faker::TheFreshPrinceOfBelAir.quote)
    end
end
