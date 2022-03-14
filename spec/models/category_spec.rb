require "spec_helper.rb"

RSpec.describe Category, type: :model do
    describe "A Category can be created" do
        before(:all) do
            @dataset = DB[:categories]
            @dataset.insert(name: "Breakfast")
            @category = Category.where(name: "Breakfast").first
        end

        after(:all) do
            @dataset.where(name: "Breakfast").delete
        end

        it "Exists" do
            expect(@category).to be_an_instance_of(Category)
            expect(@category.name).to eq("Breakfast")
            expect(@category.category_id).to be_an(Integer)
            expect(@category.recipe_id).to be_nil
        end
    end
end
