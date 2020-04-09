require 'pry'

class Song

attr_accessor :name, :songs, :artist

@@all = []

def self.all
  @@all 
end

def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist= artist if artist!=nil
    self.genre= genre if genre!=nil
  end

def save 
  @@all << self
end 

def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end
  
  def self.find_by_name(name)
    @@all.detect{|artist| artist.name == name}
  end
  
  def self.find_or_create_by_name(name)
      self.find_by_name(name) || self.create(name)
  end

def artist(artist)
    @artist = artist
    artist.add_song(self)
  end

end