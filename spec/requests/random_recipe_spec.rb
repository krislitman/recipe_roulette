require "spec_helper.rb"

RSpec.describe App, roda: :app do
    describe "A random Recipe can be found" do
        it "/random" do
            r = get "/api/v1/random"
            response = JSON.parse(r.body, symbolize_names: true)

            expect(r.status).to eq(200)
            expect(r.body).to be_a(String)
            expect(response).to be_a(Hash)
            expect(response.dig(:data).keys).to include(:name)
            expect(response.dig(:data).keys).to include(:serves)
            expect(response.dig(:data).keys).to include(:prep_time)
            expect(response.dig(:data).keys).to include(:cooking_time)
            expect(response.dig(:data).keys).to include(:ingredients)
            expect(response.dig(:data).keys).to include(:instructions)
            expect(response.dig(:data).keys).to include(:author)
            expect(response.dig(:data, :name)).to be_a(String)
            expect(response.dig(:data, :serves)).to be_a(String)
            expect(response.dig(:data, :prep_time)).to be_a(String)
            expect(response.dig(:data, :cooking_time)).to be_a(String)
            expect(response.dig(:data, :ingredients)).to be_a(String)
            expect(response.dig(:data, :instructions)).to be_a(String)
        end
    end
end
