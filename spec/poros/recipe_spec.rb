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
                instructions: "1. Open can of beans|2. Throw in a bowl|3. Chuck in chef mike|4. Profit $",
                author: "KL"
            }
            r = Recipe.new(data)

            expect(r).to be_an_instance_of(Recipe)
            expect(r.name).to be_a(String)
            expect(r.name).to eq("Fancy Recipe")
            expect(r.serves).to be_a(String)
            expect(r.serves).to eq("4-5")
            expect(r.prep_time).to be_a(String)
            expect(r.prep_time).to eq("10 Minutes")
            expect(r.cooking_time).to be_a(String)
            expect(r.cooking_time).to eq("30 Minutes")
            expect(r.ingredients).to be_an(Array)
            expect(r.ingredients.length).to eq(3)
            expect(r.ingredients[0]).to eq("Beans")
            expect(r.ingredients[1]).to eq("Rice")
            expect(r.ingredients[2]).to eq("Cheese")
            expect(r.instructions).to be_an(Array)
            expect(r.instructions.length).to eq(4)
            expect(r.instructions[0]).to eq("1. Open can of beans")
            expect(r.instructions[1]).to eq("2. Throw in a bowl")
            expect(r.instructions[2]).to eq("3. Chuck in chef mike")
            expect(r.instructions[3]).to eq("4. Profit $")
        end
    end
end
