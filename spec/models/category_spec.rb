require "spec_helper.rb"

RSpec.describe Category, type: :model do
    describe "A Category can be created" do
        before(:all) do
            dataset = DB[:categories]
            dataset.insert(name: "Breakfast")
            @category = Category.where(name: "Breakfast")
        end

        it "Exists" do
            expect(@category).to be_an_instance_of(Category)
        end
    end
end
