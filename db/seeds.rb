# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient_hash = JSON.parse(ingredient_serialized)

ingredient_hash['drinks'].each do |ingredient|
  name_ingredient = ingredient['strIngredient1']
  Ingredient.create!(name: name_ingredient)
end

cocktail1 = {
  name: 'Banana moon'
}

cocktail2 = {
  name: 'Mojito'
}

[cocktail1, cocktail2].each do |cocktail|
  Cocktail.create(cocktail)
end

dose1 = {
  description: '6cl',
  cocktail_id: Cocktail.all.sample.id,
  ingredient_id: Ingredient.all.sample.id
}

dose2 = {
  description: '12 o.z',
  cocktail_id: Cocktail.all.sample.id,
  ingredient_id: Ingredient.all.sample.id
}

[dose1, dose2].each do |dose|
  Dose.create!(dose)
end


p Ingredient.first
p Dose.first
p Cocktail.first
