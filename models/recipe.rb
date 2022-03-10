class Recipe < Sequel::Model
    class << self
        def get_random_recipe(limit)
            sql = <<-eos
                SELECT
                    *
                FROM
                    recipes r
                ORDER BY
                    random()
                LIMIT
                    #{limit}
            eos
            with_sql(sql).first
        end
    end
end
