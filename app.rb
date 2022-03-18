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

                    if recipe
                        JSON.generate(RecipeSerializer.new(recipe))
                    else
                        JSON.generate(ErrorMessage.missing(:recipe))
                    end
                end
                r.get "random", Integer do |category_id|
                    limit = r.params[:limit] || 1
                    category_id ||= nil
                    recipe = RecipeController.find_random_recipe(limit, category_id)

                    if recipe
                        JSON.generate(RecipeSerializer.new(recipe))
                    else
                        JSON.generate(ErrorMessage.missing(:recipe))
                    end
                end
            end
        end
    end
end
