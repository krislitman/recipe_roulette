# Delete Tables
require "./config/environment"

sql = <<-eos
    DROP TABLE IF EXISTS categories;
    DROP TABLE IF EXISTS recipes;
eos

DB.run(sql)
