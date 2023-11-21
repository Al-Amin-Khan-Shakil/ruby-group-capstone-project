require 'securerandom'
require 'date'

class Item
  attr_accessor :publish_date, :archived, :genre, :author, :source, :label

  def initialize(publish_date: nil, archived: false)
    @id = SecureRandom.uuid
    @publish_date = publish_date
    @archived = archived
    @author = []
    @source = []
    @label = []
    @genre = []
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - @publish_date.year > 10
  end
end
