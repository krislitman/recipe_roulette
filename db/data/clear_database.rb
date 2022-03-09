# Clear Database
require "./config/environment"

sql = <<-eos
    TRUNCATE TABLE
        recipes
eos

DB.run(sql)
