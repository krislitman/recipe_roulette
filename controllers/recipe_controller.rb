class RecipeController
    def self.random(limit, category_id)
        limit ||= 1
        recipe = Recipe.get_random_recipe(limit, category_id) || ErrorMessage.missing(:recipe)
        JSON.generate(RecipeSerializer.new(recipe))
    end

    def self.index(limit, category_id)
        limit ||= 50
        require 'pry'; binding.pry
        recipes = Recipe.get_random_recipe(limit, category_id) || ErrorMessage.missing(:recipe)
        JSON.generate(RecipeSerializer.new(recipes))
    end
end
