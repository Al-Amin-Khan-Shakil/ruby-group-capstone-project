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

    if input_number == 13
      puts "\e[31mThank you for using this app! ♥️ \e[0m"
      break
    end
    if input_number < 7
      actions(input_number, app)
    elsif input_number > 6
      actions2(input_number, app)
    end
  end
end

def actions(input_number, app)
  case input_number
  when 1
    app.list_books
  when 2
    app.list_album
  when 3
    app.list_games
  when 4
    app.list_genre
  when 5
    app.list_labels
  when 6
    app.list_authors
  else
    puts 'Invalid option, try again'
  end
end

def actions2(input_number, app)
  case input_number
  when 7
    app.list_movies
  when 8
    app.list_source
  when 9
    app.add_new_book
  when 10
    app.add_new_album
  when 11
    app.add_game
    app.save_data
  when 12
    app.add_new_movie
  else
    puts 'Invalid option, try again'
  end
end

def display_options
  puts 'Please enter or input any option [1-10]'
  puts '1. - List all books'
  puts '2. - List all music albums'
  puts '3. - List all games'
  puts '4. - List all genres'
  puts '5. - List all labels'
  puts '6. - List all authors'
  puts '7. - List all movies'
  puts '8. - List all sources'
  puts '9. - Add book'
  puts '10. - Add a music album'
  puts '11. - Add a game'
  puts '12. - Add a movie'
  puts '13. - Exit'
end

main
