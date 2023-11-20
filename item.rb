require 'securerandom'
require 'date'

class Item
  attr_accessor :publish_date, :archived, :genre, :author, :source, :label

  def can_be_archived?
    return Date.today.year == @publish_date.year > 10
  end

  def move_to_archive
    @archived = true
    @publish_date
  end

  def initialize(publish_date: nil, archived: false)
    @id = SecureRandom.uuid
    @publish_date = publish_date
    @archived = archived
    @author = []
    @source = []
    @label = []
  end

end