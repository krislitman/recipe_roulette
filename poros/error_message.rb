class ErrorMessage
    def self.missing(type)
        if type == :recipe
            {
                "error": {
                    "message": "No Recipe was found"
                }
            }
        end
    end
end
