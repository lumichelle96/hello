class Ello::Article
    attr_accessor :name,:date,:author
    
    @@all = []

    def initialize(name,date,author)
        @name = name
        @date = date
        @author = author
        @@all << self
    end

    def self.all
        @all
    end


end
