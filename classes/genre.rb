require_relative 'item'

class Genre
  attr_accessor :id, :name
  attr_reader :items

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  # setter method to add an item
  def add_item(item)
    item.genre = self
    @items << item
  end
end