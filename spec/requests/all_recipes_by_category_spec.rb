require "spec_helper.rb"

RSpec.describe App, roda: :app do
    describe "All Recipes can be found by a given Category" do
        before(:all) do
            @categories = DB[:categories]
            @categories.insert(name: "Breakfast")
            @breakfast = Category.where(name: "Breakfast").first
            @categories.insert(name: "Lunch")
            @lunch = Category.where(name: "Lunch").first
            @categories.insert(name: "Dinner")
            @dinner = Category.where(name: "Dinner").first

            @recipes = DB[:recipes]
            10.times do
                @recipes.insert(
                    category_id: @breakfast.category_id,
                    name: Faker::Food.dish,
                    serves: Faker::Number.number(digits: 1),
                    prep_time: "#{Faker::Number.number(digits: 1)} minutes",
                    cooking_time: "#{Faker::Number.number(digits: 1)} minutes",
                    ingredients: "#{Faker::Food.ingredient}|#{Faker::Food.ingredient}|#{Faker::Food.ingredient}|#{Faker::Food.ingredient}",
                    instructions: "#{Faker::Food.measurement}|#{Faker::Food.measurement}|#{Faker::Food.measurement}",
                    author: Faker::Hipster.word
                )
            end
            10.times do
                @recipes.insert(
                    category_id: @lunch.category_id,
                    name: Faker::Food.dish,
                    serves: Faker::Number.number(digits: 1),
                    prep_time: "#{Faker::Number.number(digits: 1)} minutes",
                    cooking_time: "#{Faker::Number.number(digits: 1)} minutes",
                    ingredients: "#{Faker::Food.ingredient}|#{Faker::Food.ingredient}|#{Faker::Food.ingredient}|#{Faker::Food.ingredient}",
                    instructions: "#{Faker::Food.measurement}|#{Faker::Food.measurement}|#{Faker::Food.measurement}",
                    author: Faker::Hipster.word
                )
            end
            10.times do
                @recipes.insert(
                    category_id: @dinner.category_id,
                    name: Faker::Food.dish,
                    serves: Faker::Number.number(digits: 1),
                    prep_time: "#{Faker::Number.number(digits: 1)} minutes",
                    cooking_time: "#{Faker::Number.number(digits: 1)} minutes",
                    ingredients: "#{Faker::Food.ingredient}|#{Faker::Food.ingredient}|#{Faker::Food.ingredient}|#{Faker::Food.ingredient}",
                    instructions: "#{Faker::Food.measurement}|#{Faker::Food.measurement}|#{Faker::Food.measurement}",
                    author: Faker::Hipster.word
                )
            end
        end
        after(:all) do
            @recipes.where(category_id: @breakfast.category_id).delete
            @recipes.where(category_id: @lunch.category_id).delete
            @recipes.where(category_id: @dinner.category_id).delete

            @categories.where(category_id: @breakfast.category_id).delete
            @categories.where(category_id: @lunch.category_id).delete
            @categories.where(category_id: @dinner.category_id).delete
        end

        it "Can find all breakfast recipes" do
            r = get "/api/v1/category_recipes/#{@breakfast.category_id}"
            response = JSON.parse(r.body, symbolize_names: true)

            expect(r.status).to eq(200)
            expect(r.body).to be_a(String)
            expect(response).to be_a(Hash)
        end
    end
end
