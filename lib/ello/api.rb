class Ello::API
    def self.fetch(article)
        url = "https://www.kron4.com/?s=&submit=Search/#{article}"
        response = HTTparty.get(url)

        if !response.empty?
            article_instance = Ello::Article_Name.new(article)
            response.each do |a|
                name = a["name"]
                article = a["date"]
                author = a["author"]

                Ello::Name.new(name,date,author)
            end
        else
            puts "Sorry, your article could not be found, please check spelling and type it once again."
            input = gets.chomp.downcase
            self.fetch(input)
        end
        
    end
end