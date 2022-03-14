# Delete Tables
require_relative "../db_helper"

sql = <<-eos
    DROP TABLE IF EXISTS recipes;
    DROP TABLE IF EXISTS categories;
eos

DB.run(sql)
