require "spec_helper.rb"

RSpec.describe Recipe, type: :model do
    describe "A Recipe can be instantiated" do
        it "exists with attributes" do
        data = {
            name: "fancy Recipe",
            serves: "4-5",
            prep_time: "10 Minutes",
            cooking_time: "30 Minutes",
            ingredients: "Beans|Rice|Cheese",
            instructions: "1. Open can of beans|2. Throw in a bowl|3.Chuck in chef mike|4. Profit $",
            author: "KL"
        }
        r = Recipe.new(data)
        expect(r).to be_an_instance_of(Recipe)
        expect(r.name).to be_a(String)
        expect(r.name).to eq("Fancy Recipe")
        expect(r.serves).to be_a(String)
        expect(r.serves).to eq("4-5")
        end
    end
end
