# Delete Recipes Table
require "./config/environment"

sql = <<-eos
  DROP TABLE
    recipes
eos

DB.run(sql)
