class Ello::Hello
    attr_accessor :url, :article, :body

    @@all = []

    def initialize(hash)
        @article = hash["article"]
        @url = hash["url"]
        @body = hash["body"]
        @@all << self
    end

    def self.all
        @@all
    end

end