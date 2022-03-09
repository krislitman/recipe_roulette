class RecipeController
    class << self
        def find_random_recipe
            recipes = DB[:recipes].all
            recipes.sample
        end
    end
end
