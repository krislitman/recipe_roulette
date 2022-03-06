# Create Recipes
require "./config/environment"

sql = <<-eos
  CREATE TABLE
    recipes
  (
    name VARCHAR NOT NULL,
    serves VARCHAR(100) NOT NULL,
    prep_time VARCHAR(100),
    cooking_time VARCHAR(100),
    ingredients VARCHAR NOT NULL,
    instructions VARCHAR NOT NULL,
    author VARCHAR(100) NOT NULL
  )
eos

DB.run(sql)
