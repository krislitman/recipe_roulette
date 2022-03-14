require "spec_helper.rb"

RSpec.describe Category, type: :model do
    describe "A Category can be created" do
        before(:all) do
            @dataset = DB[:categories]
            @dataset.insert(name: "Breakfast")
            @category = Category.where(name: "Breakfast").first
        end

        after(:all) do
            DB[:recipes].where(category_id: @category.category_id).delete
            @dataset.where(name: "Breakfast").delete
        end

        it "Exists" do
            expect(@category).to be_an_instance_of(Category)
            expect(@category.name).to eq("Breakfast")
            expect(@category.category_id).to be_an(Integer)
        end

        it "Can have a recipe" do
            recipes = DB[:recipes]
            recipes.insert(
                category_id: @category.category_id,
                name: "Breakfast Burrito",
                serves: "1",
                prep_time: "5 minutes",
                cooking_time: "1 minutes",
                ingredients: "eggs|potato|meat|cheese",
                instructions: "cook|roll|wrap|enjoy",
                author: "kl"
            )
            recipe = recipes.join(:categories, category_id: :category_id).first

            expect(recipe).to be_a(Hash)
        end
    end
end
