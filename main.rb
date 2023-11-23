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
    break if input_number == 10

    actions(input_number, app)
  end
end

def actions(input_number, app)
  case input_number
  when 1
    app.list_books
  when 2
    app.list_album
  when 4
    app.list_genre
  when 5
    app.list_labels
  when 7
    app.add_new_book
  when 8
    app.add_new_album
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
