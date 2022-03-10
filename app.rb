require_relative "config/environment"

class App < Roda
    route do |r|
        r.on "api" do
            r.on "v1" do
                r.on "index" do
                    response = {
                    message: "Welcome to Recipe Roulette!"
                    }

                    JSON.generate(response)
                end
                r.on "random" do
                    limit = r.params[:limit] || 1
                    recipe = RecipeController.find_random_recipe(limit)

                    JSON.generate(recipe.values)
                end
            end
        end
    end
end
