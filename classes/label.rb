require 'securerandom'
require_relative 'item'

class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = SecureRandom.uuid
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(option = {})
    {
      title: @title,
      color: @color
    }.to_json(option)
  end
end
