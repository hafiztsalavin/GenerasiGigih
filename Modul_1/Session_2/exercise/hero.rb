require_relative 'person'

class Hero < Person
    def initialize(name, hit_points, attack_damage)
        super(name, hit_points, attack_damage)
        @deflect_percentage = 0.8
    end

    def take_damage(damage)
        if rand < @deflect_percentage
            puts "#{@name} deflects the attack."
        else
            @hit_points -= damage
        end
    end
end