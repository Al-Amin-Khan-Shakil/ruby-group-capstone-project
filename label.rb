require 'securerandom'

class Label
  attr_accessor :title, :string, :items
  attr_reader :id

  def initialize(title, string)
    @id = SecureRandom.uuid
    @title = title
    @string = string
    @items = []
  end

  def add_item(item)
    @items << item
    item.label << self
  end
end