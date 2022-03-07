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
        @ingredients = clean_piped_list(data[:ingredients])
        @instructions = clean_piped_list(data[:instructions])
        @author = data[:author]
    end

    private

    def clean_name(name)
        n = name.dup
        c = n.split(" ")
        cl = c.map do |i|
            i.capitalize
        end
        cl.join(" ")
    end

    def clean_piped_list(list)
        i = list.dup
        i.split("|")
    end
end
