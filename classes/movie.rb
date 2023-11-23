require_relative 'item'
require 'date'

class Movie < Item
  attr_reader :silet

  def initialize(silet, publish_date)
    super(publish_date: publish_date)
    @silet = silet
  end

  def can_be_archived?
    super || publish_date
  end
end
