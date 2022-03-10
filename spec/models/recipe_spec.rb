require "spec_helper.rb"

RSpec.describe Recipe, type: :model do
    describe "A Recipe can be instantiated" do
        before(:each) do
            @recipe = Recipe.limit(1).first
        end

        it "exists" do
            expect(@recipe).to be_an_instance_of(Recipe)
        end

        it "has correct keys" do
            expect(@recipe.values.keys).to include(:name)
            expect(@recipe.values.keys).to include(:serves)
            expect(@recipe.values.keys).to include(:prep_time)
            expect(@recipe.values.keys).to include(:cooking_time)
            expect(@recipe.values.keys).to include(:ingredients)
            expect(@recipe.values.keys).to include(:instructions)
            expect(@recipe.values.keys).to include(:author)
        end

        it "has correct values" do
            expect(@recipe.values[:name]).to be_a(String)
            expect(@recipe.values[:serves]).to be_a(String)
            expect(@recipe.values[:prep_time]).to be_a(String)
            expect(@recipe.values[:cooking_time]).to be_a(String)
            expect(@recipe.values[:ingredients]).to be_a(String)
            expect(@recipe.values[:instructions]).to be_a(String)
            expect(@recipe.values[:author]).to be_a(String)
        end
    end
end
