require_relative '../classes/music'
require_relative '../classes/genre'
require_relative '../classes/item'

describe MusicAlbum do
  let(:genre) { Genre.new('Rock') }
  let(:on_spotify) { true }
  let(:publish_date) { Time.now }
  let(:music_album) { MusicAlbum.new(on_spotify, publish_date) }

  describe '#can_be_archived?' do
    it 'returns true if parent method returns true and on_spotify is true' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(true)

      expect(music_album.can_be_archived?).to eq(true)
    end

    it 'returns false if parent method returns false' do
      allow_any_instance_of(Item).to receive(:can_be_archived?).and_return(false)

      expect(music_album.can_be_archived?).to eq(false)
    end
  end
end
