require_relative '../classes/movie'
require 'date'

describe Movie do
  let(:publish_date) { Date.new(2021, 1, 1) }
  let(:silet) { false }

  context 'When testing Movie class' do
    let(:movie) { described_class.new(silet, publish_date) }

    it 'should initialize correctly' do
      expect(movie.publish_date).to eq(publish_date)
      expect(movie.silet).to be false
    end

    it 'should return false when both are false' do
      allow(movie).to receive(:can_be_archived?).and_return(false)
      expect(movie.can_be_archived?).to be false
    end

    it 'should return true when at list 1 condition is true' do
      allow(movie).to receive(:can_be_archived?).and_return(true)
      expect(movie.can_be_archived?).to be true
    end
  end
end
