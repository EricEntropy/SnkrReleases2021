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

    def self.set_by_brand(brand_toSet)
        attributes = []
        brand_Data = JSON.parse(self.get_by_brand(brand_toSet))
        #only get the results hash 
        brand_Data.each do |key, value|
            if key == "results"
                attributes << value
            end 
        end 
        #assign attributes to snkrs object 
        attributes[0].each do |value|
            snkrs_obj = Snkr.new
            snkrs_obj.name = value["title"]
            snkrs_obj.brand = value["brand"]
            snkrs_obj.releaseDate = value["releaseDate"]
            snkrs_obj.price = value["retailPrice"]
            snkrs_obj.type = value["shoe"]
            snkrs_obj.colorway = value["colorway"]
            snkrs_obj.imageURL = value["media"]["imageUrl"]
        end 
    end 

    def self.get_by_brand(brand_toGet)
        snkrs_URL = "https://api.thesneakerdatabase.com/v1/sneakers?limit=15&brand=#{brand_toGet}&gender=men&releaseYear=2021"
        uri = URI.parse(snkrs_URL)
        response = Net::HTTP.get_response(uri)
        response.body
    end 

end 