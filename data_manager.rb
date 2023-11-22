require 'json'

class DataManager
  def self.save_book(books)
    if books.any?
      File.write('./data/books.json', JSON.dump(books))
    else
      File.write('./date/books.json', JSON.dump([]))
    end
  end

  def self.load_books
    if File.exist?('./data./books.json')
      books = JSON.parse(File.read('./data/books.json')).map do |book|
        Book.new(book['publish_date'], book['publisher'], book['cover_state'])
      end
    else
      File.write('./data/books.json', JSON.dump([]))
    end
    books.any? ? books : []
  end
end
