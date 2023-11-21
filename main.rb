require_relative 'app'

class Main 
    def initialize
        @app = App.new 
        prompt 
    end 

    def prompt
        puts 'Catelogue of things!'
        loop do
           #code for user's intake will come here  
        end 
    end 

    #team, below is possible user's list 
    def display_options 
        puts 'Please enter or input any option [1-10]'
        puts '1. - List all books' 
        puts '2. - List all music albums' 
        puts '3. - List all games' 
        puts '4. - List all genres' 
        puts '5. - List all labels' 
        puts '6. - List all authors' 
        puts '7. - Add book' 
        puts '8. - Add a music album' 
        puts '9. - Add a game' 
        puts '10. - Exit' 
    end 
