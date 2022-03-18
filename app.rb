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
                r.get "random" do
                    limit = r.params[:limit] || 1
                    recipe = RecipeController.find_random_recipe(limit, nil)

                    JSON.pretty_generate(recipe.values)
                end
                r.get "random", Integer do |category_id|
                    limit = r.params[:limit] || 1
                    category_id ||= nil
                    recipe = RecipeController.find_random_recipe(limit, category_id)

                    JSON.generate(recipe.values)
                end
            end
        end
    end
end
