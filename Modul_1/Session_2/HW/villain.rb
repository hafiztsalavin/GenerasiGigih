require_relative 'person'

class Villain < Person
    def initialize(name, hit_points, attack_damage)
        super(name, hit_points, attack_damage)
        @flee_percentage = 0.5
        @fled = false
    end

    def take_damage(damage)
        @hit_points -= damage
        if @hit_points <= 50
            flee if rand < @flee_percentage
        end
    end

    def flee
        @fled  = true
        puts "#{@name} has fled the battlefield with #{@hit_points}"
    end

    def flee?
        @fled
    end
end

