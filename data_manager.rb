require 'json'

class DataManager
  def self.save_book(books)
    if books.any?
      File.write('./data/books.json', JSON.dump(books))
    else
      File.write('./date/books.json', JSON.dump([]))
    end
  end

  def self.save_label(labels)
    if labels.any?
      File.write('./data/labels.json', JSON.dump(labels))
    else
      File.write('./date/labels.json', JSON.dump([]))
    end
  end

  def self.load_books
    if File.exist?('./data/books.json')
      JSON.parse(File.read('./data/books.json')).map do |book|
        Book.new(book['publish_date'], book['publisher'], book['cover_state'])
      end
    else
      File.write('./data/books.json', JSON.dump([]))
      []
    end
  end

  def self.load_labels
    if File.exist?('./data/labels.json')
      JSON.parse(File.read('./data/labels.json')).map do |label|
        Label.new(label['title'], label['color'])
      end
    else
      File.write('./data/labels.json', JSON.dump([]))
      []
    end
  end
end
