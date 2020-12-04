class Cli
    def start
        puts "Welcome to Animal Crossing Villager Finder!"
        puts "loading..."
        Api.load_villagers #all info loaded and created at this point
        main_menu_options
    end

    def main_menu_options  
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
        elsif @villager = @villagers.find {|villager| villager.name == input.capitalize.gsub(" ", "") }
            villager_info
        elsif input.to_i.between?(1, 391)
            @villagers.each.with_index(1) do |villager, index| 
                 @villager = villager
                    if input.to_i == index 
                        villager_info
                    end
                end
            
        else
            puts "Whoops! Not a valid input! Please type the name or index of the Villager you'd like to find! Or type 'n' or 'exit' to close the program."
            main_menu
        end
    end

    def villager_list
        puts "Fetching friends..."
        @villagers.each.with_index(1) do |villager, index| 
            puts "#{index}. #{villager.name}"
        end
        puts "Please type the index or name of the Villager you'd like to see, or type 'exit' to exit!"
        main_menu
    end

    def villager_info
        puts "ʕ•́ᴥ•̀ʔっName: #{@villager.name}" #find a way to make 1 puts only 
        puts "ʕ•́ᴥ•̀ʔっBirthday: #{@villager.birthday}" 
        puts "ʕ•́ᴥ•̀ʔっPersonality: #{@villager.personality}"
        puts "ʕ•́ᴥ•̀ʔっSpecies: #{@villager.species}"
        puts "ʕ•́ᴥ•̀ʔっCatch-phrase: #{@villager.catch_phrase}"
        puts "If you'd like to find another Villager, just type the name or index! If you'd like to leave, type 'exit' or 'n'."
        main_menu
    end
end
