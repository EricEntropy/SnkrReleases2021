class Snkr
    attr_accessor :brand, :name, :releaseDate, :price, :type, :gender
    @@allSnkrs = []

    def initialize#(brand:, name:, releaseDate:, price:, type:)
        @brand = brand
        @title = name
        @releaseDate = releaseDate
        @price = price
        @type = type
        @gender = gender
        save
    end 

    def self.all
        @@allSnkrs
    end 

    def save 
        @@allSnkrs << self
    end 

    def self.printSnkrs(brand)
        x = 1
        @@allSnkrs.each do |value|
            if value.brand == brand2
                puts "#{x}.  #{value.name}"
                x += 1
            end
        end 
    end 

    def self.find_by_brand(brandInx)
        myBrands = ["Adidas", "Jordan", "Nike", "Vans", "Yeezy"]
        toPrint = myBrands[brandInx]
        self.printSnkrs(toPrint)
    end 




end 