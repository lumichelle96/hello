class Ello::Api
    def self.grab(article)
        url = "https://www.kron4.com/?s=&submit=Search/#{article}"
        response = HTTParty.get(url)

        if !response.empty?
            article_instance = Ello::Article_Name.new(article)
            response.each do |a|
                name = a["name"]

                Ello::Article_Name.new(name)
            end
        else
            puts "Sorry, your article could not be found, please check spelling and type it once again."
            input = gets.chomp.downcase
            self.fetch(input)
        end
        
    end
end