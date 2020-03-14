class Ello::CLI
    def start
        puts "Hello, welcome to Kron4 news."
        puts "Please type in which article you would like to look up."
        article_name = gets.chomp.downcase
        Ello::API.fetch(article_name)
    end

    def display_article
        # display's the article
    end

    def more_options
        # more articles to choose from
    end

    def loop_or_exit
        # check to see if people are done
    end

    def display_all_articles
        #display all article names
    end

    def history
        #let people look what they looked up
    end

    def display_date
        #display article date
    end

    def display_author
        # display article author
    end

end