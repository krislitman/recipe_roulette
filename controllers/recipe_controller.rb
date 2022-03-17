class RecipeController
    def self.find_random_recipe(limit)
        Recipe.get_random_recipe(limit)
    end
end
