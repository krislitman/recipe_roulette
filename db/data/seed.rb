# Seed Database
require "./config/environment"
require "./models/recipe"
require "csv"
require "pry"

recipes = DB[:recipes]
file = "db/data/recipe_list_test.csv"
csv_data = CSV.open(file, headers: true, header_converters: :symbol)
csv_data.each do |row|
    data = Recipe.new(row)
    recipes.insert(
        name: data.name,
        serves: data.serves,
        prep_time: data.prep_time,
        cooking_time: data.cooking_time,
        ingredients: data.ingredients,
        instructions: data.instructions,
        author: data.author
    )
end

puts "Recipes count: #{recipes.count}"
