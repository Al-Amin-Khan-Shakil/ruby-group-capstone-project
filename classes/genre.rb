require_relative 'item'
require 'securerandom'

class Genre
  attr_accessor :name
  attr_reader :items

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  # setter method to add an item
  def add_item(item)
    item.genre = self
    @items << item
  end
end
