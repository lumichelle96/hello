class Ello::CLI
    
    def start
        display_article
        choices
    end

    def display_article
        puts "Today's top news: "
        
        @art = Ello::Scrape.grab
        @art.each.with_index(1) do |article,i|
            puts "#{i}. #{article.article}."
        end
    end

    def choices
        input = nil
        while input != "exit"
            puts "If you would like to see the article enter the number, to see the list again type list, if you are done please type exit"
            input = gets.strip.downcase

            if input.to_i > 0
                @a = Ello::Hello.all[index]
                index = input.to_i - 1
                puts "#{@a.article[index]}/n #{@a.body[index]}"
                
            elsif input == "list"
                display_article  
            elsif input == "exit"
                bye
            else
                puts "Not sure what you want, type display or exit."
            end
        end
    end

    def bye
        puts "Bye, see you again!"
    end
end