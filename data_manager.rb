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

  def self.save_album(album)
    if album.any?
      File.write('./data/album.json', JSON.dump(album))
    else
      File.write('./date/album.json', JSON.dump([]))
    end
  end

  def self.save_genre(genre)
    if genre.any?
      File.write('./data/genre.json', JSON.dump(genre))
    else
      File.write('./date/genre.json', JSON.dump([]))
    end
  end

  def self.load_genre
    if File.exist?('./data/genre.json')
      JSON.parse(File.read('./data/genre.json')).map do |genre|
        Genre.new(genre['name'])
      end
    else
      File.write('./data/genre.json', JSON.dump([]))
      []
    end
  end

  def self.load_album
    if File.exist?('./data/album.json')
      JSON.parse(File.read('./data/album.json')).map do |album|
        MusicAlbum.new(album['on_spotify'], album['publish_date'])
      end
    else
      File.write('./data/album.json', JSON.dump([]))
      []
    end
  end

  def self.save_movie(movies)
    if movies.any?
      File.write('./data/movies.json', JSON.dump(movies))
    else
      File.write('./date/movies.json', JSON.dump([]))
    end
  end

  def self.save_source(sources)
    if sources.any?
      File.write('./data/sources.json', JSON.dump(sources))
    else
      File.write('./date/sources.json', JSON.dump([]))
    end
  end

  def self.load_source
    if File.exist?('./data/sources.json')
      JSON.parse(File.read('./data/sources.json')).map do |source|
        Source.new(source['name'])
      end
    else
      File.write('./data/sources.json', JSON.dump([]))
      []
    end
  end

  def self.load_movie
    if File.exist?('./data/movies.json')
      JSON.parse(File.read('./data/movies.json')).map do |movie|
        Movie.new(movie['silet'], movie['publish_date'])
      end
    else
      File.write('./data/movies.json', JSON.dump([]))
      []
    end
  end
end