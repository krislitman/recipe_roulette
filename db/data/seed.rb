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
file = "db/data/Recipe_List2.csv"
csv_data = CSV.open(file, headers: true, header_converters: :symbol)
csv_data.each do |row|
    data = RecipePoro.new(row)
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

puts "Category count: #{categories.count}"
puts "Recipes count: #{recipes.count}"
