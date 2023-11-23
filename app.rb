require_relative 'classes/game'
require_relative 'classes/author'
require './modules/author_module'
require './modules/game_module'
require './modules/storage'
require 'json'

class App
  include GameModule
  include AuthorModule
  include StorageModule
  attr_reader :labels, :games, :authors

  def initialize
    prep_for_storage
    @labels = []
    @games = load_games
    @authors = load_authors
  end

  def prep_for_storage
    create_file('games')
    create_file('authors')
  end

  def save_data
    save_to_file(@games.map(&:to_hash), 'games')
    save_to_file(@authors.map(&:to_hash), 'authors')
  end
end
