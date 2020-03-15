class Ello::CLI
    def start
        display_article
        choices
        bye
    end

    def display_article
        puts "Today's top news: "
        
        @articles = Ello::Api.grab
        @articles.each.with_index(1) do |article,i|
            puts "#{i}. #{article}"
        end
    end

    def choices
        input = nil
        while input != "exit"
            puts "If you would like to see the list again type display, if you are done please type exit"
            input = gets.strip.downcase

            if input == "display"
                display_article
            elsif input == "exit"
            else
                puts "Not sure what you want, type display or exit."
            end
        end
    end

    def bye
        puts "Bye, see you again!"
    end
end