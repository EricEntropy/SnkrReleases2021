class Snkr
    attr_accessor :brand, :name, :releaseDate, :price, :type, :colorway
    @@allSnkrs = []
    @@finalArray = []

    def initialize#(brand:, name:, releaseDate:, price:, type:)
        @brand = brand
        @title = name
        @releaseDate = releaseDate
        @price = price
        @type = type
        @colorway = colorway
        save
    end 

    def self.all
        @@allSnkrs
    end 

    def save 
        @@allSnkrs << self
    end 

    def self.print_brands 
        # put values of json into an array
        tempArray = []
        brands = JSON.parse(Get_API_Data.get_snkrs_brands)
        brands.each do |key, value|
            if key == "results"
                tempArray << value
            end
        end 
        # checked these and no good date so need to exclude 
        exclude = ["ASICS", "CONVERSE", "OTHER", "PUMA", "SAUCONY", "UNDER ARMOUR", "YEEZY"]
        @@finalArray = tempArray[0].sort - exclude
        @@finalArray.each.with_index(1) do |brand, index|
                puts "#{index}. #{brand.capitalize}"
        end
    end

    def self.printSnkrs
        @@allSnkrs.each.with_index(1) do |value, index|
                puts "#{index}.  #{value.name}"
        end 
    end 

    def self.print_Snkr_info(input)
        puts "Name:         #{@@allSnkrs[input].name.capitalize}"
        puts "Brand:        #{@@allSnkrs[input].brand}"
        puts "Colorway:     #{@@allSnkrs[input].colorway}"
        puts "Release Date: #{@@allSnkrs[input].releaseDate}"
        puts "Silhouette:   #{@@allSnkrs[input].type}"
        if @@allSnkrs[input].price == 0
            puts "Price(USD):   N/A"
        else puts "Price(USD):   $#{@@allSnkrs[input].price}"
        end 
    end 

    def self.find_by_Brand(brandInx)
        brand_toSet = @@finalArray[brandInx].downcase
        Get_API_Data.set_by_brand(brand_toSet)
        puts "\nYou selected: #{brand_toSet.capitalize}!"
        puts "Here is a list of upcoming #{brand_toSet.capitalize} Snkrs:"
        puts ""
        self.printSnkrs
    end  

    def self.brandsArray
        @@finalArray
    end 
end 