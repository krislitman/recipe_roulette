require_relative "config/environment"

class App < Roda
    route do |r|
        r.on "index" do
            response = {
            message: "Welcome to Recipe Roulette!"
            }

            JSON.generate(response)
        end
        r.on "random" do
            recipe = RecipeController.find_random_recipe

            JSON.generate(recipe.values)
        end
    end
end
