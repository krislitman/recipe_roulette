require "spec_helper.rb"

RSpec.describe App, roda: :app do
    describe "A random Recipe can be found by a given Category" do
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

        it "Can find a random breakfast recipe given the breakfast category id" do
            r = get "/api/v1/random/#{@breakfast.category_id}"
            response = JSON.parse(r.body, symbolize_names: true)

            expect(r.status).to eq(200)
            expect(r.body).to be_a(String)
            expect(response).to be_a(Hash)
            expect(response.dig(:data).keys).to include(:recipe_id)
            expect(response.dig(:data).keys).to include(:category_id)
            expect(response.dig(:data).keys).to include(:name)
            expect(response.dig(:data).keys).to include(:serves)
            expect(response.dig(:data).keys).to include(:prep_time)
            expect(response.dig(:data).keys).to include(:cooking_time)
            expect(response.dig(:data).keys).to include(:ingredients)
            expect(response.dig(:data).keys).to include(:instructions)
            expect(response.dig(:data).keys).to include(:author)
            expect(response.dig(:data, :category_id)).to eq(@breakfast.category_id)
        end

        it "Can find a random lunch recipe with category" do
            r = get "/api/v1/random/#{@lunch.category_id}"
            response = JSON.parse(r.body, symbolize_names: true)

            expect(response.dig(:data, :category_id)).to eq(@lunch.category_id)
        end

        it "Can find a random dinner recipe with category" do
            r = get "/api/v1/random/#{@dinner.category_id}"
            response = JSON.parse(r.body, symbolize_names: true)

            expect(response.dig(:data, :category_id)).to eq(@dinner.category_id)
        end
    end
end
