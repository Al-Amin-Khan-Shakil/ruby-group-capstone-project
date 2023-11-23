require_relative 'app'

def main
  app = App.new
  prompt(app)
end

def prompt(app)
  puts 'Catelogue of things!'
  loop do
    display_options
    input_number = gets.chomp.to_i
    if input_number == 10
      app.save_data
      puts "\e[31mThank you for using this app! ♥️ \e[0m"
      break
    end

    actions(input_number, app)
  end
end

def actions(input_number, app)
  case input_number
  when 1
    app.list_books
  when 3
    app.list_games
  when 5
    app.list_labels
  when 6
    app.list_authors
  when 7
    app.add_new_book
  when 9
    app.add_game
  else
    puts 'Invalid option, try again'
  end
end

# team, below is possible user's list
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

main
