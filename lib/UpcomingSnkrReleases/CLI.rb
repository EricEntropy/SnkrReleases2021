class CLI
    # def initialize 
    #     puts "in cli"
    # end 

    def self.begin
        welcomeMSG
        self.brands_menu 
        self.snkrs_menu
    end 

    def self.welcomeMSG
        puts "Welcome to UpcomingSnkrReleases for 2021!"
        puts "\nHere is a list of the available brands:"
        Snkr.print_brands
    end 

    def self.brands_menu 
        input = nil 
        while input != "x"
            puts "\nSelect the number for a brand you're interested in or x to exit."
            input = gets.strip
            if input == "x"
                break 
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
            puts "\nSelect the number to display Snkrs information. Type m for brands menu. Type x to exit"
            input = gets.strip
            if input == "x"
                break
            elsif input.to_i > Snkr.all.length || input.to_i < 1
                puts "Error, out of bounds."
            else 
                Snkr.print_Snkr_info(input.to_i - 1)
            end 
        end 
    end 

            
            

end 