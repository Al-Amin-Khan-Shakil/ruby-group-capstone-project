require_relative 'classes/book'
require_relative 'classes/label'
require_relative 'data_manager'

class App
  def initialize
    @books = DataManager.load_books
    @labels = DataManager.load_labels
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
    puts 'Title of book: '
    title = gets.chomp
    puts 'Published date (dd/mm/yy): '
    publish_date = Date.parse(gets.chomp)
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
end
