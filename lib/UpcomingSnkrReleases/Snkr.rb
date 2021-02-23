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

    def self.printSnkrs
        @@allSnkrs.each.with_index(1) do |value, index|
            if value.gender == "men"
                puts "#{index}.  #{value.name}"
            end
        end 
    end 

end 