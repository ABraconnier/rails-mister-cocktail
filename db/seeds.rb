# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
puts "seeding ingredients..."
json_file = JSON.parse(open(url).read)

ingredients = json_file['drinks'].map do |ingredient|
  ingredient['strIngredient1']
end

ingredients.each do |ingredient|
  Ingredient.create!(name: ingredient)
end
puts "ingredients added"

url_cocktails = 'https://www.thecocktaildb.com/api/json/v1/1/random.php'

puts "finding some good cocktails..."
20.times do
  cocktail_json_file = JSON.parse(open(url_cocktails).read)
  cocktail = cocktail_json_file['drinks'][0]['strDrink']
  Cocktail.create!(name: cocktail)
end

puts "cocktails added"
