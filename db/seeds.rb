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
  cocktail_name = cocktail_json_file['drinks'][0]['strDrink']
  cocktail_photo = cocktail_json_file['drinks'][0]['strDrinkThumb']
  cocktail = Cocktail.new(name: cocktail_name)
  cocktail.remote_photo_url = cocktail_photo
  dose = Dose.new
  dose.cocktail = dose
  i = 1
  ingredients = []
  5.times do
    ingredient = Ingredient.find_by(name: cocktail_json_file['drinks'][0]["strIngredient#{1}"])
    dose.ingredient = ingredient
    ingredients << ingredient
    i += 1
  end
  cocktail.ingredients = ingredients
  cocktail.save
  dose.save
end

puts "cocktails added"

# puts "linking it all..."

# Cocktail.all.each do |cocktail|
#   url_cocktail = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{cocktail.name}"
#   specific_cocktail = JSON.parse(open(url_cocktail).read)
#   ingredients = []
#   i = 1
#   dose = "add two spoons"
#   puts
#   15.times do
#     ingredients << specific_cocktail[0]["strIngredient#{i}"]
#     real_dose = Dose.new(description: dose)
#     real_dose.ingredient = specific_cocktail[0]["strIngredient#{i}"]
#     real_dose.cocktail = cocktail
#     real_dose.save
#     i += 1
#   end
#   cocktail.ingredients = ingredients
# end
