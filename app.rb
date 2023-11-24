require_relative 'classes/game'
require_relative 'classes/author'
require_relative 'classes/music'
require_relative 'classes/genre'
require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'classes/movie'
require_relative 'classes/source'
require_relative 'data_manager'
require './modules/author_module'
require './modules/game_module'
require './modules/storage'
require 'json'
require 'date'

class App
  include GameModule
  include AuthorModule
  include StorageModule
  attr_reader :labels, :games, :authors

  def initialize
    @books = DataManager.load_books
    @labels = DataManager.load_labels
    @album = DataManager.load_album
    @genre = DataManager.load_genre
    @movies = DataManager.load_movie
    @sources = DataManager.load_source
    prep_for_storage
    @games = load_games
    @authors = load_authors
  end

  def date_valid?(date)
    format = '%d/%m/%Y'
    DateTime.strptime(date, format)
  rescue ArgumentError
    'Invalid date format'
  end

  def published_date
    puts 'Published date (dd/mm/yyyy): '
    publish_date = gets.chomp
    while date_valid?(publish_date) == 'Invalid date format'
      puts 'Invalid date format'
      puts 'Published date (dd/mm/yyyy): '
      publish_date = gets.chomp
    end
    publish_date
  end

  def list_books
    if @books.empty?
      puts 'There is no book in your collection'
    else
      @books.each_with_index do |book, index|
        print "Publish date: #{book.publish_date} Publisher: #{book.publisher} Cover-state: #{book.cover_state} "
        print "Book-title: #{@labels[index].title}\n"
      end
    end
    puts
  end

  def list_labels
    if @labels.empty?
      puts 'There is no labels in your collection'
    else
      @labels.each_with_index do |label, index|
        puts "#{index}. Label: #{label.title} Color: #{label.color}"
      end
    end
    puts
  end

  def add_new_book
    puts 'Title of book: '
    title = gets.chomp
    publish_date = published_date
    puts 'Publisher: '
    publisher = gets.chomp
    puts 'Color of cover: '
    color = gets.chomp
    puts 'Cover-state (good or bad): '
    cover_state = gets.chomp
    new_book = Book.new(publish_date, publisher, cover_state)
    new_label = Label.new(title, color)
    new_label.add_item(new_book)
    @books << new_book
    @labels << new_label
    DataManager.save_book(@books)
    DataManager.save_label(@labels)
    puts 'Book added successfully'
  end

  def list_album
    if @album.empty?
      puts 'There are no albums saved currently'
    else
      @album.each_with_index do |album, index|
        puts "#{index}. On Spotify? : #{album.on_spotify} Date: #{album.publish_date}"
      end
    end
    puts
  end

  def list_genre
    if @genre.empty?
      puts 'There are no genres saved currently'
    else
      @genre.each_with_index do |genre, index|
        puts "#{index}. Genre: #{genre.name}"
      end
    end
    puts
  end

  def add_new_album
    publish_date = published_date
    puts 'enter Y if it\'s on spotify or N if it\'s not'
    on_spotify = gets.chomp.downcase == 'y'
    puts 'Enter a genre:'
    genre = gets.chomp
    new_album = MusicAlbum.new(on_spotify, publish_date)
    new_genre = Genre.new(genre)
    new_genre.add_item(new_album)
    @album << new_album
    @genre << new_genre
    DataManager.save_album(@album)
    DataManager.save_genre(@genre)
    puts 'Album added successfully'
  end

  def prep_for_storage
    create_file('games')
    create_file('authors')
  end

  def save_data
    save_to_file(@games.map(&:to_hash), 'games')
    save_to_file(@authors.map(&:to_hash), 'authors')
  end

  def list_movies
    if @movies.empty?
      puts 'There is no movie in your collection'
    else
      @movies.each_with_index do |movie, _index|
        puts "Publish date: #{movie.publish_date} Is silet: #{movie.silet}"
      end
    end
    puts
  end

  def list_source
    if @sources.empty?
      puts 'There is no sources in your collection'
    else
      @sources.each_with_index do |source, index|
        puts "#{index}. Source-name: #{source.name}"
      end
    end
    puts
  end

  def add_new_movie
    publish_date = published_date
    puts 'enter Y if it\'s silet or N if it\'s not'
    silet = gets.chomp.downcase == 'y'
    puts 'Source-name: '
    name = gets.chomp
    new_movie = Movie.new(silet, publish_date)
    new_source = Source.new(name)
    new_source.add_item(new_movie)
    @movies << new_movie
    @sources << new_source
    DataManager.save_movie(@movies)
    DataManager.save_source(@sources)
    puts 'Movie added successfully'
  end
end
