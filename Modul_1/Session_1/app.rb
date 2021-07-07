require_relative 'person'

jin = Person.new("Jin Sakai",100,50)	
puts jin

khotun = Person.new("khotbun",500,50)
puts khotun

loop do
	jin.attack(khotun)
	puts khotun
	puts "\n"
	break if khotun.dead?


	khotun.attack(jin)
	puts jin
	puts "\n"
    break if jin.dead?	
end

