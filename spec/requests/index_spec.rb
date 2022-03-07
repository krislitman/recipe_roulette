require "spec_helper.rb"

RSpec.describe App, roda: :app do
    it "/index" do
        index = get "/index"
        response = JSON.parse(index.body, symbolize_names: true)

        expect(index.status).to eq(200)
        expect(index.body).to be_a(String)
        expect(response[:message]).to eq("Welcome to Recipe Roulette!")
    end
end
