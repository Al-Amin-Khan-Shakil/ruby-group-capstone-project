require_relative 'item'
require 'date'

class Movie < Item
  attr_accessor :silet, :release_date
  attr_reader :can_be_archived

  def initialize(release_date, silet: true, can_be_archived: true)
    super(archived: can_be_archived, publish_date: release_date)
    @silet = silet
    @release_date = release_date
    @can_be_archived = can_be_archived
  end

  def can_be_archived?
    super || (@silet == 'bad')
  end
end
