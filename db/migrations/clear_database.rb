# Clear Database
require "./config/environment"

sql = <<-eos
    TRUNCATE TABLE
        categories
eos

DB.run(sql)

sql2 = <<-eos
    TRUNCATE TABLE
        recipes
eos

DB.run(sql2)
