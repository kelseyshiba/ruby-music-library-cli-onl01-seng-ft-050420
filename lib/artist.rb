require 'pry'
class Artist 
  extend Concerns::Findable
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name) 
    artist.save 
    artist
  end
  
  def self.destroy_all
    @@all.clear
  end

  def songs
    Song.all.find_all {|song| song.artist == self}
  end
  
  def add_song(song) #drake.add_song(INSTANCE OF A SONG NOT A STRING)
    song.artist = self
  end
  
  def genres #returns array of all Genre instances
    #songs.map {|song| song.genre}.uniq
    songs.map(&:genre).uniq
  end


end