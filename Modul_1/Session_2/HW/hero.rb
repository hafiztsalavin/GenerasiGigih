require_relative 'person'

class Hero < Person
    def initialize(name, hit_points, attack_damage)
        super(name, hit_points, attack_damage)
        @deflect_percentage = 0.8
    end

    def take_damage(damage)
        super(damage)
        if @hitpoint > 0 && @hitpoint < 50 
            flee if rand < @flee_percentage 
        end
    end

    def heal(other_person)
        other_person.get_heal(@heal_point)
        puts "#{@name} heals #{other_person.name}, restoring #{@heal_point} hitpoints"
    end
end