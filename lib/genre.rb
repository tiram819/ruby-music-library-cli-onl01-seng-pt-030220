class Genre 
  
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
  
end