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
        other_person.hit(@attack_damage)
    end

    def hit(damage)
        chance = rand(10)
        if chance <= 8
            puts "Jin Sakai deflect khotun attack"
		    puts "\n"
        else
            @hit_points -= damage
        end
    end

    def dead?
        if @hit_points <= 0
            puts "#{@name} mati"
            true
        end
    end
end 


