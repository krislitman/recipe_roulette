# Create Tables
require_relative "../db_helper"

sql = <<-eos
    DROP TABLE IF EXISTS recipes;
    DROP TABLE IF EXISTS categories;

    CREATE TABLE
        categories
    (
        category_id INT GENERATED ALWAYS AS IDENTITY,
        PRIMARY KEY (category_id),
        name VARCHAR (100)
    );

    CREATE TABLE
        recipes
    (
        recipe_id INT GENERATED ALWAYS AS IDENTITY,
        PRIMARY KEY (recipe_id),
        category_id INT,
        name VARCHAR,
        serves VARCHAR (100),
        prep_time VARCHAR (100),
        cooking_time VARCHAR (100),
        ingredients VARCHAR,
        instructions VARCHAR,
        author VARCHAR (100),
        CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES categories (category_id)
    );
eos

DB.run(sql)
