require 'active_support/all'
require './classes/author'
require './classes/item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(multiplayer:, last_played_at:, publish_date: nil, archived: false)
    super(publish_date: publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super && ((Time.now.year - @last_played_at.year) > 2)
  end
end
