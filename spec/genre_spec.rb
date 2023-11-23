require_relative '../classes/genre'
require_relative '../classes/music'

describe Genre do
  let(:genre) { Genre.new('Rock') }
  let(:music_album) { MusicAlbum.new(on_spotify: true, publish_date: Time.now) }

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
