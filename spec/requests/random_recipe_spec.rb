require "spec_helper.rb"

RSpec.describe App, roda: :app do
    describe "A random Recipe can be found" do
        it "/random" do
            r = get "/random"
            response = JSON.parse(r.body, symbolize_names: true)

            expect(r.status).to eq(200)
            expect(r.body).to be_a(String)
            expect(response.keys).to include(:recipe)
        end
    end
end
