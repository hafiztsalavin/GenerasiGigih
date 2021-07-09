require_relative "person"

class Samurai < Person
    def initialize(name, hit_points, attack_damage)
        super(name, hit_points, attack_damage)
    end
end