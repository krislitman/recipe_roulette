# Delete Tables
require_relative "../db_helper"

sql = <<-eos
    DROP TABLE IF EXISTS categories;
    DROP TABLE IF EXISTS recipes;
eos

DB.run(sql)
