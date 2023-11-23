require_relative 'classes/book'
require_relative 'classes/movie'
require 'json'

class App
  def initialize
    @books = []
    @labels = []
    @movie = []
  end

  def list_books
    if @books.empty?
      puts 'There is no book in your collection'
    else
      @books.each_with_index do |book, index|
        puts "#{index}. Publish date:#{book.publish_date} Publisher: #{book.publisher} Cover-state: #{book.cover_state}"
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
    puts 'Published date (dd/mm/yy): '
    publish_date = Date.parse(gets.chomp)
    puts 'Publisher: '
    publisher = gets.chomp
    puts 'Cover-state (good or bad): '
    cover_state = gets.chomp
    new_book = Book.new(publish_date, publisher, cover_state)
    @books << new_book
    puts 'Book added successfully'
  end
end

# start of add_movie
def add_movie
  puts 'Please add a new Movie'
  print 'Add the release_date of your Movie [yyyy/mm/dd] : '
  release_date = gets.chomp
  print 'Last, a movie was watch [yyyy/mm/dd]'
  last_time = gets.chomp
  new_movie = Movie.new(silet, release_date, last_time)
  @movie << new_movie
  puts 'Movie is added successfully'
end

# start of list_movies
def list_movies
  puts 'No movie added' if @movies.empty?
  @games.each_with_index do |movie, index|
    print "Movie #{index + 1} - "
    print "release_date: #{movie.release_date},"
    print "Last Played at: #{movie.last_time_at}\n"
  end
end

# stve movie
def save_data
  save_movies
end

# load movie
def load_data
  load_movie
end

# save movie_data to a JSON file
def save_movies
  File.open('data/movie.json', 'w') do |file|
    data = @movies.map do |movie|
      {
        'release_date' => movie.release_date
        'last_watched_at' => movie.last_watched_at
      }
    end
    file.write(JSON.generate(data))
  end
end

# start of load methed for movie
def load_movie
  if File.exit?('data/movie.json')
    data = JSON.parse(File.read('data/movie.json'))
    @movies = data.map { |movie| Movie.new(movie['release_date'], movie['last_played_at']) }
  else
    []
  end
end
