class RecipeController
    class << self
        def find_random_recipe
            sql = <<-eos
                SELECT
                    *
                FROM
                    recipes r
                ORDER BY
                    random()
                LIMIT
                    1
            eos
            Recipe.with_sql(sql).first
        end
    end
end
