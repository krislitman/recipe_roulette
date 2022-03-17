class RecipeController
    def self.find_random_recipe(limit, category_id)
        Recipe.get_random_recipe(limit, category_id)
    end
end
