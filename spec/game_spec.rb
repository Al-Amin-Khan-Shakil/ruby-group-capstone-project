require_relative 'classes/item'
require_relative 'classes/game'
require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new(publish_date: Date.new(2000, 1, 1), multiplayer: true, last_played_at: Date.new(2018, 1, 1))
  end

  it 'should have a multiplayer attribute' do
    game = Game.new(multiplayer: true, last_played_at: Time.now)
    expect(game.multiplayer).to eq(true)
  end

  it 'should have a last_played_at attribute' do
    game = Game.new(multiplayer: true, last_played_at: Time.now)
    expect(game.last_played_at).to eq(Time.now)
  end

  it 'returns false when can_be_archived? called for recent game' do
    game = Game.new(multiplayer: true, last_played_at: Time.now)
    expect(game.can_be_archived?).to eq(false)
  end

  it 'returns true when can_be_archived? called for old game' do
    game = Game.new(Time.now, true, Time.now)
    expect(game.can_be_archived?).to be true
  end
end
