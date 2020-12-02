class Cli
    def start
        puts "Welcome to Animal Crossing Villager Finder!"
        puts "loading..."
        Api.load_villagers #all info loaded and created at this point
        main_menu_options
    end

    def main_menu_options #give an option to find villagers via personality, species, or name. 
        puts "Type 'find' to list Villagers."
        puts "Type 'exit' to exit program."
        main_menu
    end

    def main_menu
        input = gets.chomp
        @villagers = Villagers.all 
        if input == "find" || input == "y"
            villager_list
        elsif input == "exit" || input == "n"
            puts "See you later!" 
        elsif @villager = @villagers.find {|villager| villager.name == input.capitalize } #maybe list options with index instead?
            villager_info
        else
            puts "Whoops! Input not recognized!"
            main_menu_options #villager_list(would prefer it bring you back)
        end
    end

    def villager_list
        puts "Fetching friends..."
        # iterate over villager and grab every unique species and put into an array
        # iterate over species array 
            # puts species:
            # iterate over villager and find_each villager that matches the species
                # puts that villager name
        @villagers.each do |villager| 
            puts villager.name
        end
        puts "Please type the name of the Villager you'd like to see, or type 'exit' to exit!"
        main_menu
    end

    def villager_info
        puts "ʕ•́ᴥ•̀ʔっName: #{@villager.name}" #find a way to make 1 puts only 
        puts "ʕ•́ᴥ•̀ʔっBirthday: #{@villager.birthday}" 
        puts "ʕ•́ᴥ•̀ʔっPersonality: #{@villager.personality}"
        puts "ʕ•́ᴥ•̀ʔっSpecies: #{@villager.species}"
        puts "ʕ•́ᴥ•̀ʔっCatch-phrase: #{@villager.catch_phrase}"
        puts "Would you like to find another Villager? Type y or n to exit."
        main_menu
    end
end
