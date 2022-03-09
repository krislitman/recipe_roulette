require "spec_helper.rb"

RSpec.describe App, roda: :app do
    describe "A random Recipe can be found" do
        it "/random" do
            r = get "/random"
            response = JSON.parse(r.body, symbolize_names: true)

            expect(r.status).to eq(200)
            expect(r.body).to be_a(String)
            expect(response).to be_a(Hash)
            expect(response.keys).to include(:name)
            expect(response.keys).to include(:serves)
            expect(response.keys).to include(:prep_time)
            expect(response.keys).to include(:cooking_time)
            expect(response.keys).to include(:ingredients)
            expect(response.keys).to include(:instructions)
            expect(response.keys).to include(:author)
            expect(response[:name]).to be_a(String)
            expect(response[:serves]).to be_a(String)
            expect(response[:prep_time]).to be_a(String)
            expect(response[:cooking_time]).to be_a(String)
            expect(response[:ingredients]).to be_a(String)
            expect(response[:instructions]).to be_a(String)
        end
    end
end
