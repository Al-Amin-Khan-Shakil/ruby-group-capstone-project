require_relative '../classes/item'

describe Item do
  let(:item) { Item.new }
  let(:label) { double('Label', items: []) }
  let(:genre) { double('Genre', items: []) }
  let(:author) { double('Author', items: []) }
  let(:source) { double('Source', items: []) }

  it 'has a unique id on initialize' do
    expect(item.id).not_to be_nil
  end

  it 'is not archived by default' do
    expect(item.archived).to eq(false)
  end

  context 'when label is assigned' do
    before do
      item.label = label
    end

    it 'sets the label' do
      expect(item.label).to eq(label)
    end

    it 'adds the item to the label items' do
      expect(label.items).to include(item)
    end
  end

  context 'when genre is assigned' do
    before do
      item.genre = genre
    end

    it 'sets the genre' do
      expect(item.genre).to eq(genre)
    end

    it 'adds the item to the genre items' do
      expect(genre.items).to include(item)
    end
  end

  context 'when author is assigned' do
    before do
      item.author = author
    end

    it 'sets the author' do
      expect(item.author).to eq(author)
    end

    it 'adds the item to the author items' do
      expect(author.items).to include(item)
    end
  end

  context 'when source is assigned' do
    before do
      item.source = source
    end

    it 'sets the source' do
      expect(item.source).to eq(source)
    end

    it 'adds the item to the source items' do
      expect(source.items).to include(item)
    end
  end

  context 'when moving to archive' do
    context 'when publish_date is more than 10 years ago' do
      before do
        publish_date - Date.today > 11
        item.move_to_archive
      end

      it 'archives the item' do
        expect(item.archived).to eq(true)
      end
    end

    context 'when publish_date is less than 10 years ago' do
      before do
        publish_date - Date.today > 9
        item.move_to_archive
      end

      it 'does not archive the item' do
        expect(item.archived).to eq(false)
      end
    end
  end
end
