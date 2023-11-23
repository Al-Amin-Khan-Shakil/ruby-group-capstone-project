require_relative '../classes/item'
require_relative '../classes/author'


RSpec.describe Author do
  let(:author) { Author.new(first_name: 'Stephen', last_name: 'King') }
  let(:item) { Item.new(publish_date: Date.new(2020, 1, 1)) }

  it 'initializes with correct first and last name' do
    expect(author.first_name).to eq('Jane')
    expect(author.last_name).to eq('Austen')
  end

  it 'adds item to author items' do
    author.add_item(item)
    expect(author.items).to include(item)
  end

  it 'sets author property on item' do
    author.add_item(item)
    expect(item.author).to eq(author)
  end
end
