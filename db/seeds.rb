require 'open-uri'
require 'json'

url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
file = open(url).read
data_hash = JSON.parse(file)

data_hash['drinks'].each do |ingredient|
  ingredient_name = ingredient['strIngredient1']
  Ingredient.create!(name: ingredient_name)
end
