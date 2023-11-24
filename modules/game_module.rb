require 'pry'
module GameModule

  def list_games
    if @games.empty?
      puts "\n\e[31mNo games available!\e[0m\n"
      puts
    else
      puts "\nList of Games\n\n"
      puts '-------------------------------------------------------------------------'
      puts "| Publish Date \t\t| Mode \t\t\t| Last Played At \t|"
      puts '-------------------------------------------------------------------------'
      @games.each do |game|
        puts "| #{game.publish_date} \t\t| #{game.multiplayer ? 'Multiplayer' : 'Singleplayer'}
        \t\t| #{game.last_played_at} \t\t|"
        puts '-------------------------------------------------------------------------'
      end
    end
  end

  def last_played
    puts 'Last played at (dd/mm/yy): '
    last_played_at = gets.chomp
    while date_valid?(last_played_at) == 'Invalid date format'
      puts 'Invalid date format'
      puts 'Last played at (dd/mm/yy): '
      last_played_at = gets.chomp
    end
    last_played_at
  end

  def add_game()
    puts "\nAdd a game:"
    publish_date = published_date
    print 'Multiplayer [Y/N]: '
    multiplayer = gets.chomp.downcase == 'y'
    last_played_at = last_played
    game = Game.new(publish_date: publish_date, multiplayer: multiplayer, last_played_at: last_played_at)
    author = game_author
    author.add_item(game)
    @games << game
    puts "\e[32mGame added successfully!\e[0m"
  end

  def game_author
    print 'Do you want to add new author (1) or select from the list (2)? [Input the number]: '
    type = gets.chomp.to_i
    case type
    when 1
      add_author
      author_id = @authors[-1].id
    when 2
      list_authors
      print "\nEnter author ID: "
      author_id = gets.chomp.to_i
    end
    find_author(author_id)
  end

  def load_games
    load_from_file('games').map do |game|
      Game.new(publish_date: game['publish_date'], multiplayer: game['multiplayer'],
               last_played_at: game['last_played_at'])
    end
  end
end
