require_relative 'item'
require 'date'

class Movie < Item
  attr_accessor :silet, :publish_date

  def initialize(silet, publish_date, archived: false)
    super(publish_date, archived: archived)
    @silet = silet
    @publish_date = publish_date
  end

  def can_be_archived?
    super && @silet
  end
end