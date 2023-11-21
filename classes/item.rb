require 'securerandom'
require 'date'

class Item
  attr_accessor :publish_date, :genre, :author, :source, :label
  attr_reader :private_id, :private_archived

  def initialize(publish_date: nil, archived: false)
    @private_id = SecureRandom.uuid
    @publish_date = publish_date
    @private_archived = archived
    @author = []
    @source = []
    @label = []
    @genre = []
  end

  def move_to_archive
    @private_archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - @publish_date.year > 10
  end
end
