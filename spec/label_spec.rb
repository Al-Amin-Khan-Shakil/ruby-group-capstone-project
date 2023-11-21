require_relative '../classes/item'
require_relative '../classes/label'
require 'securerandom'

describe Label do
  let(:title) { 'A title' }
  let(:string) { 'A string' }

  context 'When testing the Label class' do
    let(:label) { described_class.new(title, string) }

    it 'should initialize correctly' do
      expect(label.title).to eq(title)
      expect(label.string).to eq(string)
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
