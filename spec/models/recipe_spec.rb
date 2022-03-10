require "spec_helper.rb"

RSpec.describe Recipe, type: :model do
    describe "A Recipe can be instantiated" do
        it "exists with attributes" do
            recipe = Recipe.all.limit(1)

            expect(recipe).to be_an_instance_of(Recipe)
        end
    end
end
