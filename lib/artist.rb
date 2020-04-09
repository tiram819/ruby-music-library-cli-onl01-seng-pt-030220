class Artist 
  
  attr_accessor :name, :songs 
  
  @@all = []
  
  def self.all
  @@all 
end

def initialize(name)
    @name = name
    @songs = []
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
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
    end
end