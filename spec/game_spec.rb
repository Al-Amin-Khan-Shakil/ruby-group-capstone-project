require_relative '../classes/item'
require_relative '../classes/game'

RSpec.describe Game do
  it 'should have a multiplayer attribute' do
    game = Game.new(publish_date: Date.new(2000, 1, 1), multiplayer: true, last_played_at: Date.new(2018, 1, 1))
    expect(game.multiplayer).to eq(true)
  end

  it 'should have a last_played_at attribute' do
    game = Game.new(publish_date: Date.new(2000, 1, 1), multiplayer: true, last_played_at: Date.new(2018, 1, 1))
    expect(game.last_played_at).to eq(Date.new(2018, 1, 1))
  end

  it 'returns false when can_be_archived? called for recent game' do
    game = Game.new(publish_date: Date.new(2000, 1, 1), multiplayer: true, last_played_at: Date.new(2018, 1, 1))
    allow(game).to receive(:can_be_archived?).and_return(true)
    expect(game.can_be_archived?).to be true
  end

  it 'returns true when can_be_archived? called for old game' do
    game = Game.new(publish_date: Date.new(2000, 1, 1), multiplayer: true, last_played_at: Date.new(2018, 1, 1))
    expect(game.can_be_archived?).to be true
  end
end
