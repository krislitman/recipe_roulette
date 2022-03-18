# frozen_string_literal: true

require "bundler"
require "json"
require "roda"
require "pg"
require "sequel"
require "csv"
require "require_all"
require "pry"

db_env = ENV["db_env"] || "development"
DB = Sequel.connect("postgres://localhost/recipe_roulette_#{db_env}")

# poros
require_all "./poros"

# models
require_all "./models"

# controllers
require_all "./controllers"

# serializers
require_all "./serializers"
