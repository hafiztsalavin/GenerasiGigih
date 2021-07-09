class Person
    attr_reader :name, :hit_points, :attack_damage

    def initialize(name, hit_points, attack_damage)
        @name = name
        @hit_points = hit_points
        @attack_damage = attack_damage
    end

    def to_s
        "#{@name} has #{@hit_points} hitpoint and #{@attack_damage} attack damage \n"
    end

    def attack(other_person)
        puts "#{@name} attacks #{other_person.name} with #{@attack_damage} damage"
        other_person.take_damage(@attack_damage)
    end

    def take_damage(damage)
        @hit_points -= damage
    end

    def die?
        if @hit_points <= 0
            puts "#{@name} mati"
            true
        end
    end
end 


