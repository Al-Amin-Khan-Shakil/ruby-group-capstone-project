require_relative 'item'
require 'date'

class Movie < Item
  attr_accessor :silet, :publish_date

  # :director #:

  def initialize(silet, publish_date)
    super(publish_date)
    @silet = silet
    @publish_date = publish_date
  end

  def can_be_archived?
    super || (@silet == 'bad')
  end
end
