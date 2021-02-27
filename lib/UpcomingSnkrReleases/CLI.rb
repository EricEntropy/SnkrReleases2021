class CLI
    # def initialize 
    #     puts "in cli"
    # end 

    def self.begin
        welcomeMSG
    end 

    def self.welcomeMSG
        puts "Welcome to UpcomingSnkrReleases for 2021!"
        puts "Here is a list of the available brands:"
        Get_API_Data.print_brands 
        Get_API_Data.setJordans
        brandInx = self.getInput
        Snkr.find_by_brand(brandInx - 1)
    end 

    def self.getInput
        puts "\nSelect the number for a brand you're interested in:"
        gets.chomp.to_i
    end 

end 