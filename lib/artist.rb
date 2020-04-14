require_relative '../concerns/findable.rb'
class Artist

  attr_accessor :name
  attr_reader :songs
  extend Concerns::Findable

@@all = []    #class variable



def initialize(name)   #initialize method
    @name = name  #instance variable
    @songs = []
  end

  def self.all     #capital A Artist wants to call the all method
  @@all
end

def self.destroy_all
    all.clear           #resets the @@all class variable of empty array
  end

def save
  self.class.all << self
end


  def self.create(artist)
    artist=new(artist)
    artist.save
    artist
  end

  def add_song(song)
    @songs << song unless songs.include?(song)
    song.artist = self if song.artist == nil

  end


  def genres
  songs.collect do |song|
    song.genre
  end.uniq
  end


 end
