require 'pry'
require_relative '../concerns/findable.rb'


class Song

attr_accessor :name
attr_reader :genre, :artist
extend Concerns::Findable


@@all = []    #class variable



def initialize(name, artist = nil, genre = nil)   #initialize method, defaults to nil
    @name = name  #instance variable
      self.artist =artist if artist
      self.genre =genre if genre
end


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end


  def genre=(genre)
    @genre = genre
   genre.songs << self unless genre.songs.include?(self)
  end

  def self.all     #capital S song wants to call the all method
  @@all
end

def self.destroy_all
    all.clear          #resets the @@all class variable of empty array
  end

def save
  self.class.all << self       #instance(single song) we want to push to the array to save it
end


  def self.create(name)
    song=self.new(name)
    song.save
    song
  end

   #@@all.detect do |song|
      #song.name == name
    #end
  #end

  #def self.find_or_create_by_name(name)
    #self.find_by_name(name) || self.create(name)
  #end

  #def self.new_from_filename(filename)
    #array = filename.split(" - ")

    #song_name = array[1]
    #artist_name = array[0]
    #genre_name = array[2].split(".mp3").join

    #artist = Artist.find_or_create_by_name(artist_name)
    #self.artist.add_song(self)
    #genre = Genre.find_or_create_by_name(genre_name)


#end

def artist_name=(artistname)
        self.artist = Artist.find_or_create_by_name(artistname)
        self.artist.add_song(self)
     end

     def genre_name=(genrename)
       self.genre = Genre.find_or_create_by_name(genrename)
    end

    def self.new_from_filename(file)
       file = file.split(' - ')
       song = file[1]
       artist = file[0]
       genre =file[2].split('.')[0]
       # binding.pry
       song_ins = find_or_create_by_name(song)
       song_ins.artist_name = artist
       song_ins.genre_name = genre
       song_ins
    end


  def self.create_from_filename(filename)
    #self.new_from_filename(filename).save
    @@all << new_from_filename(filename)
  end
 end
