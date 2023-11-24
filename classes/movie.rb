require_relative 'item'
require 'date'

class Movie < Item
  attr_reader :silet, :publish_date

  def initialize(silet, publish_date)
    super(publish_date: publish_date)
    @silet = silet
  end

  def can_be_archived?
    super || publish_date
  end

  def to_json(option = {})
    {
      silet: @silet,
      publish_date: @publish_date
    }.to_json(option)
  end
end
