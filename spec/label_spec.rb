require_relative '../classes/item'
require_relative '../classes/label'
require 'securerandom'

describe Label do
  let(:title) { 'A title' }
  let(:color) { 'A color' }

  context 'When testing the Label class' do
    let(:label) { described_class.new(title, color) }

    it 'should initialize correctly' do
      expect(label.title).to eq(title)
      expect(label.color).to eq(color)
      expect(label.private_items).to be_empty
    end

    it 'should add item to private items array' do
      item = Item.new
      label.add_item(item)

      expect(label.private_items).to include(item)
      expect(item.label).to include(label)
    end
  end
end
