require 'pry'

class Song

attr_accessor :name, :genre, :artist

@@all = []    #class variable



def initialize(name, artist = nil, genre = nil)   #initialize method, defaults to nil
    @name = name  #instance variable
    if artist != nil
      self.artist = artist
    end
    if genre != nil
      self.genre = genre
  end
  save
end
  
  def artist
    @artist
  end 
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
  
  def genre
    @genre
  end 
  
  def genre=(genre)
    @genre = genre
   genre.songs << self unless genre.songs.include?(self)
  end 
  
  def self.all     #capital S song wants to call the all method
  @@all 
end

def self.destroy_all
    @@all = []           #resets the @@all class variable of empty array
  end

def save 
  @@all << self       #instance(single song) we want to push to the array to save it
end 


  def self.create(name)
    self.new(name)
  end
  
  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end
  
  def self.new_from_filename(filename)
    array = filename.split(" - ")
    
    song_name = array[1]
    artist_name = array[0]
    genre_name = array[2].split(".mp3").join
    
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
end
  
  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
 end