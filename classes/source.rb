require 'securerandom'
require_relative 'item'

class Source
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.source = self
  end
end
