require 'securerandom'
require_relative 'item'

class Label
  attr_accessor :name
  attr_reader :id

  def initialize(name)
    @id = SecureRandom.uuid
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
