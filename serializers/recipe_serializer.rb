require "jserializer"

class RecipeSerializer < Jserializer::Base
    root :data
    attributes :recipe_id, :category_id, :name, :serves, :prep_time, :cooking_time, :ingredients, :instructions, :author
end
