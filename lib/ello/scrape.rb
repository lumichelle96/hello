require 'open-uri'

class Ello::Scrape

    def self.grab
        self.hash
    end

    def self.hash

        article = self.article_names
        links = self.article_links
        body = self.article_body


        articles = {}
        articles[:title] = article
        articles[:url] = links
        articles[:body] = body

        Ello::Hello.new(articles)


    end


    def self.names
        news = URI.open("https://www.kron4.com/news")
        ello = Nokogiri::HTML.parse(news)
    end

    def self.article_names
        self.names.css('div.article-list__article-text a').map.with_index {|name| name.text.strip}
    end

    def self.article_links
        self.names.css('div.article-list__article-text a').map.with_index { |link| link ['href'].strip }
    end

    def self.article_body
       body = self.article_links
       hello = body.join()
       shy = Nokogiri::HTML(open(hello))

       shy.css('div.article-content rich-text').map.with_index {|name| name.text.strip}
    end
end
