require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date)
    super(publish_date: publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(option = {})
    {
      publish_date: @publish_date,
      on_spotify: @on_spotify
    }.to_json(option)
  end
end
