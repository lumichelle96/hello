class Ello::CLI
    def start
        puts "Hello, welcome to Kron4 news."
        puts "Please type in which article you would like to look up."
        article_name = gets.chomp.downcase
        Ello::Api.grab(article_name)
        display_article
        loop_or_exit
    end

    def display_article
        Ello::Article_Name.all.each.with_index(1) do |a,index|
            puts "#{index}. #{a.name}"
            puts"------"
        end
    end

    def loop_or_exit
        puts "Would you like to search more articles? enter y/n"
        input = gets.chomp.downcase
        if input == "y"
            start
        else
            puts "Would you like to the history of what you have searched? enter y/n"
            new_input = gets.chomp.downcase
            history(new_input)
        end
    end

    def history(input)
        if input == "y"
            display_article
            loop_or_exit
        else 
            exit
        end 
    end

end