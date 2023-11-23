require './classes/author'
require './classes/item'
require_relative '../modules/storage'

class Game < Item
  include StorageModule
  attr_reader :multiplayer, :last_played_at

  def initialize(multiplayer:, last_played_at:, publish_date: nil, archived: false)
    super(publish_date: publish_date, archived: archived)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    super && ((Time.now.year - @last_played_at.year) > 2)
  end

  def to_hash
    {
      type: self.class.name,
      publish_date: @publish_date,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }
  end
end
