require "bundler"
require "json"
require "roda"
require "pg"
require "sequel"
require "csv"
require "require_all"

# models
require_all "./models"

# controllers
require_all "./controllers"

db_env = ENV["db_env"] || "development"
DB = Sequel.postgres("recipe_roulette_#{db_env}", user: "", password: "", host: "localhost")
