require "sequel"

db_env = ENV["db_env"] || "development"
DB = Sequel.connect("postgres://localhost/recipe_roulette_#{db_env}")
