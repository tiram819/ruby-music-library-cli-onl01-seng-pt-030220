
require_relative '../concerns/findable.rb'
class Genre

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
  all.clear             #resets the @@all class variable of empty array
  end

def save
  @@all << self       #instance(single song) we want to push to the array to save it
end


  def self.create(genre)
    genre=self.new(genre)
    genre.save
    genre
  end


  def artists
    songs.collect do |song|
      song.artist
    end.uniq
  end

end
