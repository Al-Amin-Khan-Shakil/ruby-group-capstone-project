require_relative '../classes/genre'
require_relative '../classes/music'
require 'date'

describe Genre do
  let(:genre) { Genre.new('Rock') }
  let(:on_spotify) { true }
  let(:publish_date) { Time.now }
  let(:music_album) { MusicAlbum.new(on_spotify, publish_date) }

  describe '#add_item' do
    it 'adds an item to the genre' do
      genre.add_item(music_album)
      expect(genre.items).to include(music_album)
    end

    it 'sets the genre of the item' do
      genre.add_item(music_album)
      expect(music_album.genre).to eq(genre)
    end
  end
end
