class Dog
    def initialize(breed)
        @breed = breed
    end

    def bark
        puts "woof woof"
    end
end

class Lab <  Dog
    def initialize(breed,name)
        
        @name = name
    end

    def to_s
        "(#@breed, #@name)"
    end

    def bark
        super()
        puts "woof woof labradoe"
    end
end


laby = Lab.new("Labrador", "Benzy")
puts laby