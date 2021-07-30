class Wli
    attr_writer :names

    def likes
        
        if @names.count == 1
            "#{@names[0]} like this"
        elsif @names.count == 2
            "#{@names[0]} and #{@names[1]} like this"
        elsif @names.count == 3
            "#{@names[0]} #{@names[1]} and #{@names[2]} like this"
        elsif @names.count > 3
            "#{@names[0]} #{@names[1]} and 2 others like this"
        else
            "no one like this"
        end
    end
end