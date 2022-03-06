require_relative "config/environment"

class App < Roda
    route do |r|
        r.on "index" do
            response = {
            message: "Welcome to Recipe Roulette!"
            }

            JSON.generate(response)
        end
    end
end
