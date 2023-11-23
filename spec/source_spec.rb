require_relative '../classes/item'
require_relative '../classes/source'
require 'securerandom'

describe Source do
  let(:name) { 'A movie name' }

  context 'When testing the Source class' do
    let(:source) { described_class.new(name) }

    it 'should initialize correctly' do
      expect(source.name).to eq(name)
      expect(source.items).to be_empty
    end

    it 'should add item to private items array' do
      item = Item.new
      source.add_item(item)

      expect(source.items).to include(item)
      expect(item.source).to eq(source)
    end
  end
end
