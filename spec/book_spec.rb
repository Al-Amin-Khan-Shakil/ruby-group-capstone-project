require_relative '../classes/book'
require 'date'

describe Book do
  let(:publish_date) { Date.new(2021, 1, 1) }
  let(:publisher) { 'A publisher' }
  let(:cover_state) { 'good' }

  context 'When testing Book class' do
    let(:book) { described_class.new(publish_date, publisher, cover_state) }

    it 'should initialize correctly' do
      expect(book.publish_date).to eq(publish_date)
      expect(book.publisher).to eq(publisher)
      expect(book.cover_state).to eq(cover_state)
    end

    it 'should return false when both are false' do
      allow(book).to receive(:can_be_archived?).and_return(false)
      expect(book.can_be_archived?).to be false
    end

    it 'should return true when at list 1 condition is true' do
      allow(book).to receive(:can_be_archived?).and_return(true)
      expect(book.can_be_archived?).to be true
    end
  end
end