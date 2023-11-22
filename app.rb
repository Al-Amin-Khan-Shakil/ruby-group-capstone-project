require_relative 'classes/game'
require_relative 'classes/author'
require './modules/author_module'
require './modules/game_module'

class App
  include GameModule
  include AuthorModule
  attr_reader :labels, :games, :authors

  def initialize
    @labels = []
    @games = []
    @authors = []
  end
end
