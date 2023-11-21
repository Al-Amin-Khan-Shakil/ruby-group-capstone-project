require 'securerandom'

class Label
  attr_accessor :title, :string
  attr_reader :private_id, :private_items

  def initialize(title, color)
    @private_id = SecureRandom.uuid
    @title = title
    @color = color
    @private_items = []
  end

  def add_item(item)
    @private_items << item
    item.label << self
  end
end
