require "spec_helper.rb"

RSpec.describe App, roda: :app do
    describe "A random Recipe can be found by a given Category" do
        before(:all) do
            @categories = DB[:categories]
            @categories.insert(name: "Breakfast")
            @breakfast = Category.where(name: "Breakfast").first

            
        end
    end
end
