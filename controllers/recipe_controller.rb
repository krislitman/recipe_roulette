class RecipeController
    def self.random(limit, category_id)
        limit ||= 1
        recipe = Recipe.get_random_recipe(limit, category_id) || ErrorMessage.missing(:recipe)
        JSON.generate(RecipeSerializer.new(recipe))
    end
end
