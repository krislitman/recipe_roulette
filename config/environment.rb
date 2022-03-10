# frozen_string_literal: true

require "bundler"
require "json"
require "roda"
require "pg"
require "sequel"
require "csv"
require "require_all"
require "pry"

# poros
require_all "./poros"

# controllers
require_all "./controllers"

db_env = ENV["db_env"] || "development"
DB = Sequel.postgres("recipe_roulette_#{db_env}", user: "", password: "", host: "localhost")
