require 'securerandom'
require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :id, :archived, :label, :author, :genre, source

  def initialize(publish_date: nil, archived: false)
    @id = SecureRandom.uuid
    @publish_date = publish_date
    @archived = archived
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - @publish_date.year > 10
  end

  def to_hash
    {
      id: @id,
      author: @author,
      publish_date: @publish_date,
      label: @label,
      archived: @archived
    }
  end
end