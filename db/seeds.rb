require "JSON"
require "open-uri"


# 1 recup json
url = "http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
json_string = open(url).read
ingredients_data = JSON.parse(json_string)["drinks"]

puts "Destroying ingredients"
Ingredient.destroy_all


print "Creating ingredients"
ingredients_data.each do |ingredient|
  Ingredient.create!(name: ingredient["strIngredient1"])
  print "."
end
puts "done"
