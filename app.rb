require_relative "config/environment"

class App < Roda
    route do |r|
        r.on "api" do
            r.on "v1" do
                r.get "random" do
                    RecipeController.random(r.params[:limit], nil)
                end
                r.get "random", Integer do |category_id|
                    RecipeController.random(r.params[:limit], category_id)
                end
                r.get "category_recipes", Integer do |category_id|
                    RecipeController.index(r.params[:limit], category_id)
                end
            end
        end
    end
end
