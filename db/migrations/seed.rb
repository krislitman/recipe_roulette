# Seed Database
require "./config/environment"
require "./models/recipe"
require "csv"
require "pry"

categories = DB[:categories]
categories_file = "db/data/categories.csv"
category_data = CSV.open(categories_file, headers: true, header_converters: :symbol)
category_data.each do |row|
    categories.insert(
        name: row[:name]
    )
end

recipes = DB[:recipes]
file = "db/data/Recipe_List.csv"
csv_data = CSV.open(file, headers: true, header_converters: :symbol)
csv_data.each do |row|
    recipes.insert(
        name: row[:name],
        serves: row[:serves],
        prep_time: row[:prep_time],
        cooking_time: row[:cooking_time],
        ingredients: row[:ingredients],
        instructions: row[:instructions],
        author: row[:author],
        category_id: row[:category_id]
    )
end

puts "Category count: #{categories.count}"
puts "Recipes count: #{recipes.count}"
