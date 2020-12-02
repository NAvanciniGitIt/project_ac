class Villagers
    attr_accessor :name, :birthday, :personality, :species, :catch_phrase

    @@all = [] 
    
    def initialize(name, birthday, personality, species, catch_phrase)
        @name = name
        @birthday = birthday
        @personality = personality
        @species = species
        @catch_phrase = catch_phrase
        @@all << self
    end
    
    def self.all
        @@all
    end

end