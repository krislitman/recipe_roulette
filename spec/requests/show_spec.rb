require "spec_helper.rb"

RSpec.describe App, roda: :app do
    describe "A random Recipe can be found" do
        it "/show" do
            show = get "/show"
            response = JSON.parse(response, symbolize_names: true)

            expect(show.status).to eq(200)
            expect(show.body).to be_a(String)
            expect(response.keys).to include(:recipe)
        end
    end
end
