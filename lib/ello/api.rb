require 'HTTParty'

class Ello::Api
    
    def self.grab
        self.hash
    end

    def self.hash

        articles = self.article_names
        links = self.article_links

        Hash[articles.zip(links)]

    end


    def self.names
        news = HTTParty.get("https://www.kron4.com/news")
        ello = Nokogiri::HTML.parse(news)
        ello.css('div.article-list__content') 
    end

    def self.article_names
        self.names.css('div.article-list__article-text a').map.with_index {|name| name.text.strip}
    end

    def self.article_links
        self.names.css('div.article-list__article-text a').map.with_index { |link| link ['href'].strip }
    end
end