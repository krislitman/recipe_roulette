class Recipe
    attr_reader :name,
                :serves,
                :prep_time,
                :cooking_time,
                :ingredients,
                :instructions,
                :author

    def initialize(data)
        @name = clean_name(data[:name])
        @serves = data[:serves]
        @prep_time = data[:prep_time]
        @cooking_time = data[:cooking_time]
        @ingredients = data[:ingredients]
        @instructions = data[:instructions]
        @author = data[:author]
    end

    private

    def clean_name(name)
        c = name.split(" ")
        cl = c.map do |i|
        i.capitalize
        end
        cl.join(" ")
    end
end
