class RecipeController
    class << self
        def find_random_recipe(limit)
            Recipe.get_random_recipe(limit)
        end
    end
end
