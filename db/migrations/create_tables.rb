# Create Tables
require_relative "../db_helper"

sql = <<-eos
    DROP TABLE IF EXISTS categories;
    DROP TABLE IF EXISTS recipes;

    CREATE TABLE
        recipes
    (
        recipe_id INT GENERATED ALWAYS AS IDENTITY,
        PRIMARY KEY(recipe_id),
        name VARCHAR NOT NULL,
        serves VARCHAR(100) NOT NULL,
        prep_time VARCHAR(100),
        cooking_time VARCHAR(100),
        ingredients VARCHAR NOT NULL,
        instructions VARCHAR NOT NULL,
        author VARCHAR(100)
    );

    CREATE TABLE
        categories
    (
        category_id INT GENERATED ALWAYS AS IDENTITY,
        PRIMARY KEY (category_id),
        recipe_id INT,
        name VARCHAR NOT NULL,
        CONSTRAINT fk_recipe
        FOREIGN KEY(recipe_id)
        REFERENCES recipes(recipe_id)
    );
eos

DB.run(sql)
