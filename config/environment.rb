require "bundler"
require "json"
require "roda"
require "pg"
require "sequel"
require "csv"

db_env = ENV["db_env"] || "development"
DB = Sequel.postgres("recipe_roulette_#{db_env}", user: "", password: "", host: "localhost")

require "./models/recipe"
