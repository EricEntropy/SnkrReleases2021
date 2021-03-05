class CLI
    def self.begin
        welcomeMSG
        self.brands_menu 
        self.snkrs_menu
    end 

    def self.welcomeMSG
        puts "\nWelcome to UpcomingSnkrReleases for 2021!"
        puts "Here is a list of the available brands:"
        puts ""
    end 

    def self.brands_menu 
        Snkr.print_brands
        input = nil 
        while input != "x"
            puts "\nSelect the number for a brand you're interested in or x to exit."
            input = gets.strip
            if input == "x"
                exit
            elsif input.to_i > Snkr.brandsArray.length || input.to_i < 1
                puts "Error, out of bounds."
            else 
                Snkr.find_by_Brand(input.to_i - 1)
                input = "x"
            end
        end 
    end 

    def self.snkrs_menu 
        input = nil 
        while input != "x"
            puts "\nSelect the number to display Snkrs information. Type m to show brands. Type x to exit"
            input = gets.strip
            if input == "x"
                break
            elsif input == "m"
                Snkr.all.clear
                self.brands_menu 
            elsif input.to_i > Snkr.all.length || input.to_i < 1
                puts "Error, out of bounds."
            else 
                puts "\nHere is some information about your selection:"
                Snkr.print_Snkr_info(input.to_i - 1)
            end 
        end 
    end 
end 