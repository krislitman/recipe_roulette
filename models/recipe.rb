class Recipe < Sequel::Model

    def self.get_random_recipe(limit, category_id)
        if !category_id.nil? && (category_id = category_id.to_i)
            sql = <<-eos
                SELECT
                    *
                FROM
                    recipes r
                WHERE
                    r.category_id = #{category_id}
                ORDER BY
                    random()
                LIMIT
                    #{limit}
            eos
        else
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
        end
        with_sql(sql).first
    end
end
