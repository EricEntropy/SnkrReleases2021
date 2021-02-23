class Get_API_Data
    # def initialize 
    #     puts "in scraper"
    # end 

    def self.get_snkrs_brands
        brands_URL = "https://api.thesneakerdatabase.com/v1/brands"
        uri = URI.parse(brands_URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end

    def self.print_brands 
        brandsArray = []
        #my brands since i will only be using 5 and need for comparing
        myBrands = ["JORDAN", "NIKE", "VANS", "YEEZY", "ADIDAS"]

        #put values of json into an array
        brands = JSON.parse(self.get_snkrs_brands)
        brands.each do |key, value|
            brandsArray << value
        end 

        #flatten the array to be one dimensional and sort alphabetically
        finalArray = brandsArray.flatten.sort
        x = 1
        finalArray.each_with_index do |brand|
            if myBrands.include?(brand)
                puts "#{x}. #{brand.capitalize}"
                x += 1
            end 
        end 
    end 

    def self.getJordans
        jordansURL = "https://api.thesneakerdatabase.com/v1/sneakers?limit=20&brand=Jordan&releaseYear=2021"
        uri = URI.parse(jordansURL)
        response = Net::HTTP.get_response(uri)
        response.body
    end 

    def self.printJordans
        attributes = []
        jordanData = JSON.parse(self.getJordans)
        #only get the results hash 
        jordanData.each do |key, value|
            if key == "results"
                attributes << value
            end 
        end 
        #assign attributes to snkrs object 
        attributes[0].each do |value|
            jordan_obj = Snkr.new
            jordan_obj.name = value["title"]
            jordan_obj.brand = value["brand"]
            jordan_obj.releaseDate = value["releaseDate"]
            jordan_obj.price = value["retailPrice"]
            jordan_obj.type = value["shoe"]
            jordan_obj.gender = value["gender"]
        end 
    end 
end 